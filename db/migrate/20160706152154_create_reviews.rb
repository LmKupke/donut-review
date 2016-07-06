class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :user, null: false
      t.belongs_to :donut, null: false
      t.integer :rating, null: false
      t.string :body
    end
  end
end
