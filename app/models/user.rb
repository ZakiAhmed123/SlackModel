class User < ActiveRecord::Base

  has_many :posts

  has_secure_password

  validates :username, :password, presence: true
  attachment :photo

end
