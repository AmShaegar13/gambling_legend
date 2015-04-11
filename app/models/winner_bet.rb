class WinnerBet < BetType
  def process!(bet, match)
    if match.winner == 100 && bet.choice.label == 'TEAM_BLUE' ||
        match.winner == 200 && bet.choice.label == 'TEAM_RED'
      bet.win!
    else
      bet.lose!
    end
  end
end
