class User < ActiveRecord::Base

  has_many :posts

  has_secure_password

  validates :user_name, :password, :first_name, :last_name, presence: true
  validates :user_name, :email, uniqueness: true
  attachment :photo

end
