class BaronsBet < BetType
  def process!(bet, match)
    choice = bet.choice.label
    barons = match.barons
    case barons
    when 0
      choice == 'NO_BARONS' ? bet.win! : bet.lose!
    when 1, 2
      choice =~ /BARONS_#{barons}/ ? bet.win! : bet.lose!
    else
      choice == 'BARONS_3+' ? bet.win! : bet.lose!
    end
  end
end
