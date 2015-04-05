class BetType < ActiveRecord::Base
  has_many :choices, class_name: 'BetChoice'
end
