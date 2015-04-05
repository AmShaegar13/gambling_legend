class BetChoice < ActiveRecord::Base
  belongs_to :type, class_name: 'BetType'
end
