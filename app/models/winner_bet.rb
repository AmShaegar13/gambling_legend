class WinnerBet < BetType
  def won?(choice, match)
    choice == match.winner
  end
end
