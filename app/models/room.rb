class Room < ActiveRecord::Base

  has_many :users
  has_many :posts

  validates :room_name, presence: true

end
