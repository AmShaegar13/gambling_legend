class User < ActiveRecord::Base
  cattr_accessor :current_user

  attr_accessor :guest
  alias_method :guest?, :guest

  has_many :bets

  has_secure_password
  validates_presence_of :login, :name, :email, :last_refill
  validates_uniqueness_of :login, :name, :email

  validate do
    errors.add :balance, 'cannot be negative' if balance < 0
  end

  before_validation do
    self.balance ||= 1000
    self.last_refill ||= Time.now
    self.login ||= name.downcase
  end

  def self.guest(session)
    new(
      name: 'Guest',
      guest: true,
      balance: session[:balance] || 1000
    ) do |u|
      u.readonly!
    end
  end
end
