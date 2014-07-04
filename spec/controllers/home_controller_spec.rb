require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'timeline'" do
    it "returns http success" do
      get 'timeline'
      expect(response).to be_success
    end
  end

end
