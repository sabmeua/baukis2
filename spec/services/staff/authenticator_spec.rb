require "rails_helper"

describe Staff::Authenticator do
  describe "#authenticate" do
    it "returns true when the password is correct" do
      m = build :staff_member
      expect(Staff::Authenticator.new(m).authenticate("pw")).to be_truthy
    end

    it "returns false when the password isn't correct" do
      m = build :staff_member
      expect(Staff::Authenticator.new(m).authenticate("xy")).to be_falsey
    end

    it "returns false when the password isn't set" do
      m = build :staff_member
      expect(Staff::Authenticator.new(m).authenticate(nil)).to be_falsey
    end

    it "returns false when the suspend flag is set" do
      m = build :staff_member, suspended: true
      expect(Staff::Authenticator.new(m).authenticate("pw")).to be_truthy
    end

    it "returns false when it isn't started" do
      m = build :staff_member, start_date: Date.tomorrow
      expect(Staff::Authenticator.new(m).authenticate("pw")).to be_falsey
    end

    it "returns false when it is ended" do
      m = build :staff_member, end_date: Date.today
      expect(Staff::Authenticator.new(m).authenticate("pw")).to be_falsey
    end
  end
end
