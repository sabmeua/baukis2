require "rails_helper"

RSpec.describe StaffMember, type: :model do
  describe "#password=" do
    it "passes a string and hashed_password will be a 60 characters string" do
      member = StaffMember.new
      member.password = "baukis"
      expect(member.hashed_password).to be_kind_of(String)
      expect(member.hashed_password.size).to eq(60)
    end

    it "passes nil and hashed_password will be nil" do
      member = StaffMember.new(hashed_password: "x")
      member.password = nil
      expect(member.hashed_password).to be_nil
    end
  end
end
