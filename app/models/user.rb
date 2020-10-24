class User < ApplicationRecord
  has_secure_password
  validates_presence_of :first_name, :last_name, :email, :password_digest
  validates :email, uniqueness: { case_sensitive: false }
end
