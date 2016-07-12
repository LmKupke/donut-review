require "rails_helper"

RSpec.describe Vote, type: :model do
  it { should have_valid(:vote).when(1, 0, -1) }
  it { should_not have_valid(:vote).when(2, nil, -2) }
end
