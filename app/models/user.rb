class User < ActiveRecord::Base
  attr_accessor :guest
  alias_method :guest?, :guest

  has_secure_password
  validates_presence_of :name, :email, :last_refill

  before_create do
    self.login = name.downcase
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
