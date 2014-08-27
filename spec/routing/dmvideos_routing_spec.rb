require "rails_helper"

RSpec.describe DmvideosController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dmvideos").to route_to("dmvideos#index")
    end

    it "routes to #new" do
      expect(:get => "/dmvideos/new").to route_to("dmvideos#new")
    end

    it "routes to #show" do
      expect(:get => "/dmvideos/1").to route_to("dmvideos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dmvideos/1/edit").to route_to("dmvideos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/dmvideos").to route_to("dmvideos#create")
    end

    it "routes to #update" do
      expect(:put => "/dmvideos/1").to route_to("dmvideos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dmvideos/1").to route_to("dmvideos#destroy", :id => "1")
    end

  end
end
