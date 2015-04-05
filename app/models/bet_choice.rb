class BetChoice < ActiveRecord::Base
  belongs_to :type, class_name: 'BetType', foreign_key: 'type_id'
end
