# Model for default users
class User < ApplicationRecord

  acts_as_token_authenticatable

  validates_presence_of :first_name, :last_name, :email, :password
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
