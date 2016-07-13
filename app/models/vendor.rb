class Vendor < ActiveRecord::Base

  belongs_to :user
  has_many :donuts
  STATES = %w(
    AL AK AS AZ AR CA CO CT DE DC FM FL GA GU HI ID IL IN IA KS KY LA ME MH
    MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND MP OH OK OR PW PA PR RI SC
    SD TN TX UT VT VI VA WA WV WI WY AE AA AP
  )

  validates :name, presence: true
  validates :street_number, presence: true
  validates :street_number, numericality: { only_integer: true }
  validates :street_number, numericality: { greater_than: -1 }
  validates :street_name, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2 }, inclusion: { in: STATES }
  validates :zipcode, presence: true, length: { is: 5 }
  validates :zipcode, numericality: { only_integer: true, greater_than: -1 }
  validates :user_id, presence: true

  def full_address
    "#{street_number} #{street_name} #{city}, #{state} #{zipcode}"
  end
end
