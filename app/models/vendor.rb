class Vendor < ActiveRecord::Base
  has_many :donuts

  validates :name, presence: true
  validates :street_number, presence: true
  validates :street_number, numericality: { only_integer: true, min: 0 }
  validates :street_name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true, length: { is: 5 }
end
