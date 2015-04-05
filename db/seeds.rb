# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! name: 'AmShaegar', email: 'login@amshaegar.de', password: 'asdasd', last_refill: Time.now

BetType.create! label: 'TEAM_WIN'
BetChoice.create! type: BetType.first, label: 'TEAM_BLUE'
BetChoice.create! type: BetType.first, label: 'TEAM_RED'
