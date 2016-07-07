class CreateDonuts < ActiveRecord::Migration
  def change
    create_table :donuts do |t|
      t.string :name, null: false
      t.text :description
      t.string :vendor_name, null: false
      t.string :image, null: false
      t.belongs_to :user, null: false
    end
  end
end
