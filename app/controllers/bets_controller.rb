class BetsController < ApplicationController
  def index
    @bet = Bet.new amount: 0
    @bet_types = BetType.includes(:choices)
    @seconds = 600 - Time.now.to_i % 600
  end
  
  def create
    render json: { status: 'success', msg: 'message' }
  end
end
