require 'rails_helper'

RSpec.describe Administrator, type: :model do
  describe "#password=" do
    it "passes a string and hashed_password will be a 60 characters string" do
      admin = Administrator.new
      admin.password = "baukis"
      expect(admin.hashed_password).to be_kind_of(String)
      expect(admin.hashed_password.size).to eq(60)
    end

    it "passes nil and hashed_password will be nil" do
      admin = StaffMember.new(hashed_password: "x")
      admin.password = nil
      expect(admin.hashed_password).to be_nil
    end
  end
end
