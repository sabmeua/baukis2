# @note The class method "shared_example" takes a name of shared example as argument.
#
shared_examples "a protected admin controller" do |controller|
  let(:args) do
    {
      host: Rails.application.config.baukis2[:admin][:host],
      controller: controller
    }
  end

  describe "#index" do
    it "redirects to login form" do
      get url_for(args.merge(action: :index))
      expect(response).to redirect_to(admin_login_url)
    end
  end

  describe "#show" do
    it "redirects to login form" do
      get url_for(args.merge(action: :show, id: 1))
      expect(response).to redirect_to(admin_login_url)
    end
  end
end

shared_examples "a protected singular admin controller" do |controller|
  let(:args) do
    {
      host: Rails.application.cnfig.baukis2[:admin][:host],
      controller: controller
    }
  end

  describe "#show" do
    it "redirects to login form" do
      get url_for(args.merge(action: :show))
      expect(response).to redirect_to(admin_login_url)
    end
  end
end
