class Bet < ActiveRecord::Base
  belongs_to :choice, class_name: 'BetChoice', foreign_key: 'choice_id'
end
