class Donut < ActiveRecord::Base
  include PgSearch

  has_many :reviews
  belongs_to :vendor, polymorphic: true
  belongs_to :user, polymorphic: true

  validates :name, presence: true
  validates :vendor_id, presence: true
  validates :image, presence: true
  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :description, length: { maximum: 140 }

  # multisearchable against: [:name, :description]
  #
  # pg_search_scope :search_donut_and_reviews,
  #   against: [:name, :description],
  #   associated_against: {
  #     reviews: [:body]
  #   }
  #
  # scope :global_search, lambda { |query|
  #   search_donut_and_reviews(query) if query.present?
  # }
end
