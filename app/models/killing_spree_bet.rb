class KillingSpreeBet < BetType
  def process!(bet, match)
    choice = bet.choice.label
    killing_spree = match.killing_spree
    case killing_spree
    when 0..2
      choice == 'NO_KILLING_SPREE' ? bet.win! : bet.lose!
    when 3..7
      choice =~ /KILLING_SPREE_#{killing_spree}/ ? bet.win! : bet.lose!
    else
      choice == 'KILLING_SPREE_8+' ? bet.win! : bet.lose!
    end
  end
end
