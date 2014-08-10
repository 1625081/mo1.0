require "rails_helper"

RSpec.describe MusicsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/musics").to route_to("musics#index")
    end

    it "routes to #new" do
      expect(:get => "/musics/new").to route_to("musics#new")
    end

    it "routes to #show" do
      expect(:get => "/musics/1").to route_to("musics#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/musics/1/edit").to route_to("musics#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/musics").to route_to("musics#create")
    end

    it "routes to #update" do
      expect(:put => "/musics/1").to route_to("musics#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/musics/1").to route_to("musics#destroy", :id => "1")
    end

  end
end
