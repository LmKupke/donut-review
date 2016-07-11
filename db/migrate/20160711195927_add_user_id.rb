class AddUserId < ActiveRecord::Migration
  def up
    add_column :vendors, :user_id, :integer, null: false
  end

  def down
    remove_column :vendors, :user_id
  end
end
