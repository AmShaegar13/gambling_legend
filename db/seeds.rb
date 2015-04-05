# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! name: 'AmShaegar', email: 'login@amshaegar.de', password: 'asdasd', last_refill: Time.now, balance: 1000

BetType.create! label: 'TEAM_WIN' do |type|
  BetChoice.create! type: type, label: 'TEAM_BLUE'
  BetChoice.create! type: type, label: 'TEAM_RED'
end

BetType.create! label: 'LARGEST_MULTIKILL' do |type|
  BetChoice.create! type: type, label: 'MULTIKILL_1'
  BetChoice.create! type: type, label: 'MULTIKILL_2'
  BetChoice.create! type: type, label: 'MULTIKILL_3'
  BetChoice.create! type: type, label: 'MULTIKILL_4'
  BetChoice.create! type: type, label: 'MULTIKILL_5'
end
