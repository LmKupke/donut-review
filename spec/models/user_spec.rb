require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:first_name).when("Jimmy", "Linc") }
  it { should_not have_valid(:first_name).when(nil, "") }

  it { should have_valid(:last_name).when("Ranger", "Kupke") }
  it { should_not have_valid(:last_name).when(nil, "") }

  it { should have_valid(:email).when("example@gmail.com", "erlich@aviato.net") }
  it { should_not have_valid(:email).when("example", "example@",
    "exam@gma", "example.com", nil) }

  describe "#admin?" do
    context "when user is a admin" do
      it "will return true if user an admin" do
        user = create(:user, role: "admin")
        expect(user.admin?).to eq(true)
      end
    end

    context "when user is a member" do
      it "should give back false" do
        user = create(:user)
        expect(user.admin?).to eq(false)
      end
    end
  end

  describe "#fullname" do
    it 'returns the first and last name as one string' do
      user = create(:user)
      expect(user.fullname).to eq("Bertram Guilfoyle")
    end
  end
end
