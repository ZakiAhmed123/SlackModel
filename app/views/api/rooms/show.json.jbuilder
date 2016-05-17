json.room do
  json.id @room.id
  json.room_name @room.room_name
  json.posts @room.posts do |post|
    json.id post.id
    json.text post.text
    json.room_id post.room_id
      json.user do
        json.id post.user.id
        json.username post.user.user_name
        json.photo_id post.user.photo_id
      end
    end
end
