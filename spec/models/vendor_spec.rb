require 'rails_helper'

RSpec.describe Vendor, type: :model do
  it { should have_valid(:name).when("Dunkin", "Krispy Kreme") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:street_number).when(2, 0) }
  it { should_not have_valid(:street_number).when("", nil, -1, 1.1) }

  it { should have_valid(:street_name).when("Comm Ave.", "State Street") }
  it { should_not have_valid(:street_name).when("", nil) }

  it { should have_valid(:city).when("Boston", "New York") }
  it { should_not have_valid(:city).when("", nil) }

  it { should have_valid(:state).when("MA", "NY") }
  it { should_not have_valid(:state).when("New York", "", nil, "Canada", "ZH") }

  it { should have_valid(:zipcode).when("00000", "20000") }
  it { should_not have_valid(:zipcode).when("", nil, "22", "222222", "3.333") }
end
