class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user_id, presence: true, uniqueness: true
  validates :review_id, presence: true
  validates :vote, presence: true, inclusion: { in: [1, 0, -1] }
end
