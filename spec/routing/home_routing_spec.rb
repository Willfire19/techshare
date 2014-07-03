require "rails_helper"

RSpec.describe DevicesController, :type => :routing do
  describe "routing" do

    it "routes to root" do
      expect(:get => "/").to route_to("home#home")
    end

    it "routes to #home" do
      expect(:get => "/").to route_to("home#home")
    end

    it "routes to #home" do
      expect(:get => "/home").to route_to("home#home")
    end

    it "routes to #profile" do
      expect(:get => "/profile").to route_to("home#profile")
    end

  end
end