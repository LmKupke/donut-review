class AddVendorId < ActiveRecord::Migration
  def up
    add_column :donuts, :vendor_id, :integer, null: false
    remove_column :donuts, :vendor_name
  end

  def down
    remove_column :donuts, :vendor_id
    add_column :donuts, :vendor_name, :string, null: false
  end
end
