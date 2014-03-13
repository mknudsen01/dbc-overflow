class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :username, :password_digest, :email
end
