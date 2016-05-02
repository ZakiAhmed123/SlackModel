class AddPosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :user_id
      t.string :text
      t.integer :room_id
      t.timestamps null: false
    end
  end
end
