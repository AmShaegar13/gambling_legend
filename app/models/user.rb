class User < ActiveRecord::Base
  has_secure_password
  
  validate_presence_of :name
  validate_presence_of :email
  validate_presence_of :last_refill
end
