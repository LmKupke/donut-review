require "rails_helper"

RSpec.describe Review, type: :model do
  it { should have_valid(:rating).when(2, 5) }
  it { should_not have_valid(:rating).when(6, 2.3, "") }

  it { should have_valid(:body).when("good donut", "bad donut") }
  it { should_not have_valid(:body).when("A" * 141) }
end
