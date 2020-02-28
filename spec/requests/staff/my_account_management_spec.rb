require "rails_helper"

describe "Staff account management" do

  # @note This block emulates a login with "staff_member" account,
  #       otherwise it isn't set the id to update.
  before do
    post staff_session_url, params: {
      staff_login_form: {
        email: staff_member.email, password: "pw"
      }
    }
  end

  describe "Update" do
    let(:params_hash) { attributes_for(:staff_member) }
    let(:staff_member) { create(:staff_member) }

    it "changes email attribute" do
      params_hash.merge!(email: "test@example.com")
      patch staff_account_url, params: { id: staff_member.id, staff_member: params_hash }
      staff_member.reload
      expect(staff_member.email).to eq("test@example.com")
    end

    it "raises ActionController::ParameterMissing exception" do
      expect { patch staff_account_url, params: { id: staff_member.id } }.to raise_error(ActionController::ParameterMissing)
    end

    it "can't update end_date" do
      params_hash.merge!(end_date: Date.tomorrow)
      expect {
        patch staff_account_url, params: { id: staff_member.id, staff_member: params_hash }
      }.not_to change { staff_member.end_date }
    end
  end
end
