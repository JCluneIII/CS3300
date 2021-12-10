require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations tests" do
    it "ensures the email is present" do
      user = User.new(password: "testpass")
      expect(user.valid?).to eq(false)
    end
    it "should create a new user" do
      user = User.new(email: "test@user.com", password: "testpass")
      expect(user.valid?).to eq(true)
    end
  end
end
