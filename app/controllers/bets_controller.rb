class BetsController < ApplicationController
  def index
    @bet = Bet.new amount: 0
    @bet_types = BetType.includes(:choices)
    @seconds = 600 - Time.now.to_i % 600
  end
  
  def create
    bet = params.require :bet
    type = bet.require(:bet_type).require(:label)
    
    render json: { status: 'success', action: 'disable', type: type }
  end
  
  def destroy
    bet = params.require :bet
    type = bet.require(:bet_type).require(:label)
    
    render json: { status: 'success', action: 'enable', type: type }
  end
end
