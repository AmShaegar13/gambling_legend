class DragonsBet < BetType
  def process!(bet, match)
    choice = bet.choice.label
    dragons = match.dragons
    case dragons
    when 0
      choice == 'NO_DRAGONS' ? bet.win! : bet.lose!
    when 1..4
      choice =~ /DRAGONS_#{dragons}/ ? bet.win! : bet.lose!
    else
      choice == 'DRAGONS_5+' ? bet.win! : bet.lose!
    end
  end
end
