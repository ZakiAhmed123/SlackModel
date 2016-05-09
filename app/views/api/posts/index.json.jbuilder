json.posts @posts do |post|
  json.id post.id
  json.text post.text
  json.user_id post.user_id
  json.room_id post.room_id
  json.user do
    json.id post.user.id
    json.user_name post.user.user_name
    json.first_name post.user.first_name
    json.last_name post.user.last_name
    json.email post.user.email
    json.photo_id post.user.photo_id
  end
end
