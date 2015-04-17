module BetsHelper
  def win(bet)
    if bet.won?
      win = bet.amount * bet.odds
      '+ %d' % [win]
    else
      '- %d' % [bet.amount]
    end
  end
end
