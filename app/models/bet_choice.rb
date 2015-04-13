class BetChoice < ActiveRecord::Base
  belongs_to :type, class_name: 'BetType', foreign_key: 'type_id'

  default_scope { order:id }

  def odds(match = nil)
    return @odd unless @odds.nil?

    choices = type.choices.count
    bets = Bet.completed(match).where(choice: self).count + 10
    bets_sum = Bet.completed(match).where(type: type).count + 10 * choices
    bets_sum = 1 if bets_sum == 0

    @odds = 1 + choices * (1 - bets.to_f/bets_sum)
  end
end
