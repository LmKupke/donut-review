class Donut < ActiveRecord::Base
  has_many :reviews
  belongs_to :vendor
  belongs_to :user

  validates :name, presence: true
  validates :vendor_id, presence: true
  validates :image, presence: true
  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :description, length: { maximum: 140 }
end
