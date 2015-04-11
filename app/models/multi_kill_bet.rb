class MultiKillBet < BetType
  def process!(bet, match)
    bet.choice.label =~ /MULTIKILL_#{match.multi_kill}/ ? bet.win! : bet.lose!
  end
end
