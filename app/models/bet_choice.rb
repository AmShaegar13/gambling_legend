class BetChoice < ActiveRecord::Base
  belongs_to :type, class_name: 'BetType', foreign_key: 'type_id'

  default_scope { order:id }

  def odds
    choices = type.choices.count
    matches = Match.where('? IN (winner_id, barons_id, multi_kill_id, dragons_id, killing_spree_id)', self.id).count
    matches_sum = Match.count
    matches_sum = 1 if matches_sum == 0

    1 + choices * (1 - matches.to_f/matches_sum)
  end
end
