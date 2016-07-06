class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :donut

  validates :user_id, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, minimum: 0, maximum: 5 }
  validates :donut_id, presence: true
  validates :body, length: { maximum: 140 }
end