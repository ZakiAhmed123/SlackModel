class Post < ActiveRecord::Base

  belongs_to :user
  belongs_to :room

  validates :text, presence: true

  def timestamp
    created_at.strftime '%l:%M %p'
  end

end
