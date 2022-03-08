class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  
  has_secure_password
  has_secure_token :api_key
end
