class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :type, class_name: 'BetType', foreign_key: 'type_id'
  belongs_to :choice, class_name: 'BetChoice', foreign_key: 'choice_id'
  belongs_to :match

  scope :current, -> { where(won: nil) }
  scope :completed, -> (match) { where.not(won: nil, match: match) }

  validates_presence_of :user, :type, :choice, :amount
  validates_associated :user
  validates_uniqueness_of :type, scope: [:user, :match]

  validate do
    errors.add :amount, 'must be positive' if amount <= 0
    errors.add :choice, 'must be of correct type' unless type.choices.include? choice
  end

  before_create do
    user.balance -= amount
    user.save!
  end

  after_destroy do
    user.balance += amount
    user.save!
  end

  def process!(match)
    if type.won? self.choice, match
      self.won = true

      user.balance += choice.odds(match) * amount
      user.save!
    else
      self.won = false
      save!
    end

    self.match = match
    save!
  end
end
