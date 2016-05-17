json.posts @posts do |post|
  json.id post.id
  json.text post.text
  json.user_id post.user_id
  json.room_id post.room_id
  json.created_at post.created_at
  json.updated_at post.updated_at
  json.timestamp post.timestamp
  json.user do
    json.id post.user.id
    json.user_name post.user.user_name
    json.first_name post.user.first_name
    json.last_name post.user.last_name
    json.email post.user.email
    json.user_photo_url attachment_url(post.user, :photo, :fill, 70, 70, format: "jpg")
  end
end
