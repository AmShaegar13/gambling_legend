class Bet < ActiveRecord::Base
  belongs_to :choice, class_name: 'BetChoice', foreign_key: 'choice_id'
  belongs_to :user
  belongs_to :match
  has_one :type, through: :choice, class_name: 'BetType', foreign_key: 'type_id'

  validates_presence_of :amount, :choice, :user
  validates_associated :user

  validate do
    errors.add :amount, 'must be positive' if amount <= 0

    if self.class.joins(:type).where(
      bet_choices: {
        type_id: type.id
      },
      user: user,
      match: match
    ).exists?
      errors.add :bet, 'has already been taken'
    end
  end

  before_create do
    user.balance -= amount
    user.save!
  end
end
