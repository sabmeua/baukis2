require 'rails_helper'

describe "Staff member management by administrator" do
  let(:administrator) { create(:administrator) }

  # @note By including FactoryBot::Syntax::Method in rails_helper.rb allows
  #       to call "attributes_for" and "create" methods.

  # @note "let" defines memoized helper method.
  #       It mostly same as lazy initialization. "@params_hash ||= attributes_for(:staff_member)"
  describe "Create" do
    let(:params_hash) { attributes_for(:staff_member) }

    it "redirects to staff member list" do
      # @note "post" simulates psued HTTP request in Rspec.
      #       "response" is a method which returns ActionController::TestResponse object.
      post admin_staff_members_url, params: { staff_member: params_hash }
      expect(response).to redirect_to(admin_staff_members_url)
    end

    it "raises ActionController::ParameterMissing exception" do
      expect { post admin_staff_members_url }.to raise_error(ActionController::ParameterMissing)
    end
  end

  describe "Update" do
    let(:staff_member) { create(:staff_member) }
    let(:params_hash) { attributes_for(:staff_member) }

    it "sets suspended flag" do
      params_hash.merge!(suspended: true)
      patch admin_staff_member_url(staff_member), params: { staff_member: params_hash }
      staff_member.reload
      # @note "be_<property>" method like "be_suspended" is called be matcher.
      #       be_matcher isn't defined individually, so when an undefined method which has
      #       "be_" prefix is called, it performs the method named "<property>?".
      expect(staff_member).to be_suspended
    end

    it "doesn't update hashed_password" do
      params_hash.delete(:password)
      params_hash.merge!(hashed_password: "x")
      expect {
        patch admin_staff_member_url(staff_member), params: { staff_member: params_hash }
      }.not_to change { staff_member.hashed_password.to_s }

      # @note "expect{X}.not_to change {Y}" is typical description to check the value has not changed.
    end
  end
end
