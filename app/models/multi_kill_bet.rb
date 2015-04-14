class MultiKillBet < BetType
  def won?(choice, match)
    choice == match.multi_kill
  end
end
