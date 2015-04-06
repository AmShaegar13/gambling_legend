class BetsController < ApplicationController
  def index
    @user = User.current_user
    @bets = Hash.new(Bet.new(amount: 0))
    @user.bets.current.includes(:type).each do |bet|
      @bets[bet.type.label] = Bet.new(amount: bet.amount)
    end
    @bet_types = BetType.includes(:choices)
    @seconds = 600 - Time.now.to_i % 600
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
      render json: { status: 'error', message: '<strong>Unexpected error.</strong> ' + (bet.errors.full_messages + bet.user.errors.full_messages).join(', ') }
      return
    end

    render json: { status: 'success', action: 'disable', type: type.label }
  end

  def destroy
    bet_params = params.require :bet
    type = BetType.find_by(label: bet_params.require(:bet_type).require(:label))

    # TODO

    render json: { status: 'success', action: 'enable', type: type.label }
  end
end
