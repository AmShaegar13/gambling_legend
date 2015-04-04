class User < ActiveRecord::Base
  attr_accessor :guest
  alias_method :guest?, :guest

  has_secure_password
  validates_presence_of :name, :email, :last_refill

  before_create do
    self.login = name.downcase
  end
  
  def self.guest
    new(name: 'Guest', guest: true) do |u|
      u.readonly!
    end
  end
end
