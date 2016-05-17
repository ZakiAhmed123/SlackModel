class DeleteroomId < ActiveRecord::Migration
  def change
    remove_column :users, :room_id, :integer
  end
end
