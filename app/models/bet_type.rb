class BetType < ActiveRecord::Base
  has_many :choices, class_name: 'BetChoice', foreign_key: 'type_id'

  default_scope { order:id }

  def process!(bet, match)
    raise "Don't know how to process #{self.class.name}"
  end
end
