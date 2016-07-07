class Donut < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  validates :name, presence: true
  validates :vendor_name, presence: true
  validates :image, presence: true
  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :description, length: { maximum: 140 }
end
