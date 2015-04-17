class User < ActiveRecord::Base
  cattr_accessor :current_user

  has_many :bets

  validates_presence_of :login, :name, :last_refill, :lang
  validates :lang, inclusion: { in: %w(de en fr) }
  has_secure_password

  validates_presence_of :email, unless: :guest?
  validates_uniqueness_of :login, :name, :email, unless: :guest?

  validate do
    errors.add :balance, 'cannot be negative' if balance < 0
  end

  before_validation do
    self.balance ||= 1000
    self.last_refill ||= Time.now.utc
    self.login ||= name.downcase
    self.lang ||= 'en'
  end

  def guest?
    name == 'Guest'
  end
end
