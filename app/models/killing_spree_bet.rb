class KillingSpreeBet < BetType
  def won?(choice, match)
    choice == match.killing_spree
  end
end
