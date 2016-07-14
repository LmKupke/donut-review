class Review < ActiveRecord::Base
  include PgSearch

  paginates_per 10
  belongs_to :user
  belongs_to :donut
  has_many :votes

  validates :user_id, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 1..5 }
  validates :donut_id, presence: true
  validates :body, length: { maximum: 140 }

  multisearchable against: [:body]
end
