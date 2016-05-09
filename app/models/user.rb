class User < ActiveRecord::Base

  has_many :posts

  has_secure_password

  validates :user_name, :password, presence: true
  attachment :photo

end
