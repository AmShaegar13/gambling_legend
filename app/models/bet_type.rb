class BetType < ActiveRecord::Base
  has_many :choices, class_name: 'BetChoice', foreign_key: 'type_id'
end
