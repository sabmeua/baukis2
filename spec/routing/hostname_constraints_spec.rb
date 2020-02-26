require 'rails_helper'

describe "Routing" do
  it "tests staff top page" do
    config = Rails.application.config.baukis2
    url = "http://#{config[:staff][:host]}/#{config[:staff][:path]}"
    expect(get: url).to route_to(
      host: config[:staff][:host],
      controller: "staff/top",
      action: "index"
    )
  end

  it "tests admin login page" do
    config = Rails.application.config.baukis2
    url = "http://#{config[:admin][:host]}/#{config[:admin][:path]}/login"
    expect(get: url).to route_to(
      host: config[:admin][:host],
      controller: "admin/sessions",
      action: "new"
    )
  end

  it "tests customer top page" do
    config = Rails.application.config.baukis2
    url = "http://#{config[:customer][:host]}/#{config[:customer][:path]}"
    expect(get: url).to route_to(
      host: config[:customer][:host],
      controller: "customer/top",
      action: "index"
    )
  end

  it "isn't routable if the host name isn't defined" do
    expect(get: "http://foo.example.jp").not_to be_routable
  end

  it "isn't routable if the path isn't defined" do
    config = Rails.application.config.baukis2
    expect(get: "http://#{config[:staff][:host]}/xyz").not_to be_routable
  end
end
