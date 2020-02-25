require "rails_helper"

describe Admin::Authenticator do
  describe "#authenticate" do
    it "returns true when the password is correct" do
      m = build :administrator
      expect(Admin::Authenticator.new(m).authenticate("pw")).to be_truthy
    end

    it "returns false when the password isn't correct" do
      m = build :administrator
      expect(Admin::Authenticator.new(m).authenticate("xy")).to be_falsey
    end

    it "returns false when the password isn't set" do
      m = build :administrator
      expect(Admin::Authenticator.new(m).authenticate(nil)).to be_falsey
    end

    it "returns false when the suspend flag is set" do
      m = build :administrator, suspended: true
      expect(Admin::Authenticator.new(m).authenticate("pw")).to be_truthy
    end
  end
end
