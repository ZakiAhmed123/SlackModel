class Post < ActiveRecord::Base

  belongs_to :user
  belongs_to :room

  validates :text, presence: true

end
