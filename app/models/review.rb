class Review < ActiveRecord::Base
  validates :user_id, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..5 }
  validates :donut_id, presence: true
  validates :body, length: { maximum: 140 }
end
