class BetsController < ApplicationController
  def index
    @bets = BetType.includes(:choices)
    @seconds = 600 - Time.now.to_i % 600
  end
end
