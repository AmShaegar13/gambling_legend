class BetsController < ApplicationController
  LOCK_FILE = 'tmp/bets.lock'
  INTERVAL = 600

  def index
    if File.exist?(LOCK_FILE)
      @locked = File.open(LOCK_FILE).read.gsub(/\n/, "<br>").html_safe
      render 'locked'
      return
    end

    @user = User.current_user
    @bets = Hash.new(Bet.new(amount: 0))
    @user.bets.current.includes(:type).each do |bet|
      @bets[bet.type.label] = Bet.new(amount: bet.amount, choice: bet.choice)
    end
    @bet_types = BetType.select("*, '' AS type").includes(:choices)
    @seconds = INTERVAL - Time.now.to_i % INTERVAL
  end

  before_action only: [:create, :destroy] do
    if File.exist?(LOCK_FILE)
      render json: { status: 'error', message: '<strong>Calculating...</strong> Bets are locked while calculating results.' }
    end
  end

  def create
    bet_params = params.require :bet
    type = BetType.find_by(label: bet_params.require(:bet_type).require(:label))
    choice = BetChoice.find_by(label: bet_params[:choice], type: type)

    bet = Bet.create(
      user: User.current_user,
      type: type,
      choice: choice,
      amount: bet_params.require(:amount)
    )

    unless bet.persisted?
      render json: { status: 'error', message: '<strong>Error.</strong> ' + (bet.errors.full_messages + bet.user.errors.full_messages).join(', ') }
      return
    end

    render json: { status: 'success', action: 'disable', type: type.label, balance: User.current_user.balance, amount: bet.amount }
  end

  def destroy
    bet_params = params.require :bet
    type = BetType.find_by(label: bet_params.require(:bet_type).require(:label))

    bet = Bet.find_by(
      user: User.current_user,
      type: type,
      match: nil
    )

    if bet.nil?
      render json: { status: 'error', message: '<strong>Unexpected error.</strong> Could not find your bet' }
      return
    end

    bet.destroy
    User.current_user.reload

    render json: { status: 'success', action: 'enable', type: type.label, balance: User.current_user.balance, amount: bet.amount }
  end

  def history
    @user = User.current_user
    @bets = @user.bets.completed.order(id: :desc).includes(:type, :choice)
  end
end
