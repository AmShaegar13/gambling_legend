class BetsController < ApplicationController
  def index
    @bet = Bet.new amount: 0
    @bet_types = BetType.includes(:choices)
    @seconds = 600 - Time.now.to_i % 600
    @user = User.current_user
  end

  def create
    bet_params = params.require :bet
    type = BetType.find_by(label: bet_params.require(:bet_type).require(:label))

    if bet_params[:choice].nil?
      render json: { status: 'error', type: type.label, message: '<strong>No choice was made.</strong> Please select a choice to bet on.' }
      return
    end

    choice = BetChoice.find_by(label: bet_params[:choice], type: type)

    unless type.choices.include? choice
      render json: { status: 'error', type: type.label, message: '<strong>Invalid choice.</strong> Something went wrong. Please contact the site administrator.' }
      return
    end

    bet = Bet.create amount: bet_params.require(:amount), choice: choice, user: User.current_user

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
