class BetChoice < ActiveRecord::Base
  belongs_to :type, class_name: 'BetType', foreign_key: 'type_id'

  default_scope { order:id }

  def odds
    matches = Match.where('? IN (winner_id, barons_id, multi_kill_id, dragons_id, killing_spree_id)', self.id).count
    matches_sum = Match.count
    matches = 1 if matches == 0

    matches_sum.to_f/matches
  end
end
