class BaronsBet < BetType
  def won?(choice, match)
    choice == match.barons
  end
end
