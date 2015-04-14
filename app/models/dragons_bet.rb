class DragonsBet < BetType
  def won?(choice, match)
    choice == match.dragons
  end
end
