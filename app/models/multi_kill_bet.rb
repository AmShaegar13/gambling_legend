class MultiKillBet < BetType
  def process!(bet, match)
    choice = bet.choice.label
    multi_kill = match.multi_kill
    case multi_kill
    when 0, 1
      choice == 'NO_MULTIKILL' ? bet.win! : bet.lose!
    when 2..4
      choice =~ /MULTIKILL_#{multi_kill}/ ? bet.win! : bet.lose!
    else
      choice == 'MULTIKILL_5+' ? bet.win! : bet.lose!
    end
  end
end
