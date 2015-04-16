class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :type, class_name: 'BetType', foreign_key: 'type_id'
  belongs_to :choice, class_name: 'BetChoice', foreign_key: 'choice_id'
  belongs_to :match

  scope :current, -> { where(won: nil) }
  scope :completed, -> { where.not(won: nil, match: match) }

  validates_presence_of :user, :type, :choice, :amount
  validates_associated :user
  validates_uniqueness_of :type, scope: [:user, :match]

  validate do
    errors.add :amount, 'must be positive' if amount <= 0
    errors.add :choice, 'must be of correct type' if choice.present? && !type.choices.include?(choice)
  end

  before_create do
    self.odds = choice.odds

    user.balance -= amount
    user.save!
  end

  after_destroy do
    user.balance += amount
    user.save!
  end

  def process!(match)
    if type.won? choice, match
      self.won = true

      user.balance += odds * amount
      user.save!
    else
      self.won = false
    end

    self.match = match
    save!
  end
end
