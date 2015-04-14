class Match < ActiveRecord::Base
  belongs_to :winner, class_name: 'BetChoice', foreign_key: 'winner_id'
  belongs_to :barons, class_name: 'BetChoice', foreign_key: 'barons_id'
  belongs_to :multi_kill, class_name: 'BetChoice', foreign_key: 'multi_kill_id'
  belongs_to :dragons, class_name: 'BetChoice', foreign_key: 'dragons_id'
  belongs_to :killing_spree, class_name: 'BetChoice', foreign_key: 'killing_spree_id'
end
