require "rails_helper"

RSpec.describe Donut, type: :model do
  it { should have_valid(:name).when("Coconut", "Glazed") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:vendor_id).when(2) }
  it { should_not have_valid(:vendor_id).when("", nil) }

  it { should have_valid(:image).when(File.open(File.join("#{Rails.root}/spec/support/images/photo.png"))) }
  it { should_not have_valid(:image).when("", nil) }

  it { should have_valid(:description).when("Great donut") }
  it { should_not have_valid(:description).when("A" * 200) }
end
