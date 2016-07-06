require "rails_helper"

RSpec.describe Donut, type: :model do
  it { should have_valid(:name).when("Coconut", "Glazed") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:vendor_name).when(
    "Donna's Donuts",
    "Dunkin' Donuts")
  }
  it { should_not have_valid(:vendor_name).when("", nil) }

  it { should have_valid(:image).when(
    "http://goo.gl/x1ezfx",
    "http://goo.gl/lkxVyA") 
  }
  it { should_not have_valid(:image).when("", nil) }

  it { should have_valid(:description).when("Great donut") }
  it { should_not have_valid(:description).when("A" * 200) }
end
