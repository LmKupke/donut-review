class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name, null: false
      t.integer :street_number, null: false
      t.string :street_name, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zipcode, null: false
      t.timestamps null: false
    end
  end
end
