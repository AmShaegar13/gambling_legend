User.create! name: 'AmShaegar', email: 'login@email.com', password: 'asdasd', last_refill: Time.now, balance: 1000
User.create! name: 'Freigeist', email: 'your@email.com', password: 'asdasd', last_refill: Time.now, balance: 1000

WinnerBet.create! label: 'TEAM_WIN' do |type|
  BetChoice.create! type: type, label: 'TEAM_BLUE'
  BetChoice.create! type: type, label: 'TEAM_RED'
end

BaronsBet.create! label: 'BARONS_KILLED' do |type|
  BetChoice.create! type: type, label: 'NO_BARONS'
  BetChoice.create! type: type, label: 'BARONS_1'
  BetChoice.create! type: type, label: 'BARONS_2'
  BetChoice.create! type: type, label: 'BARONS_3+'
end

MultiKillBet.create! label: 'LARGEST_MULTIKILL' do |type|
  BetChoice.create! type: type, label: 'MULTIKILL_1'
  BetChoice.create! type: type, label: 'MULTIKILL_2'
  BetChoice.create! type: type, label: 'MULTIKILL_3'
  BetChoice.create! type: type, label: 'MULTIKILL_4'
  BetChoice.create! type: type, label: 'MULTIKILL_5'
end

DragonsBet.create! label: 'DRAGONS_KILLED' do |type|
  BetChoice.create! type: type, label: 'NO_DRAGONS'
  BetChoice.create! type: type, label: 'DRAGONS_1'
  BetChoice.create! type: type, label: 'DRAGONS_2'
  BetChoice.create! type: type, label: 'DRAGONS_3'
  BetChoice.create! type: type, label: 'DRAGONS_4'
  BetChoice.create! type: type, label: 'DRAGONS_5+'
end

KillingSpreeBet.create! label: 'LARGEST_KILLING_SPREE' do |type|
  BetChoice.create! type: type, label: 'NO_KILLING_SPREE'
  BetChoice.create! type: type, label: 'KILLING_SPREE_3'
  BetChoice.create! type: type, label: 'KILLING_SPREE_4'
  BetChoice.create! type: type, label: 'KILLING_SPREE_5'
  BetChoice.create! type: type, label: 'KILLING_SPREE_6'
  BetChoice.create! type: type, label: 'KILLING_SPREE_7'
  BetChoice.create! type: type, label: 'KILLING_SPREE_8+'
end
