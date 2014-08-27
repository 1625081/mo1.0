require 'rails_helper'

RSpec.describe "Dmvideos", :type => :request do
  describe "GET /dmvideos" do
    it "works! (now write some real specs)" do
      get dmvideos_path
      expect(response.status).to be(200)
    end
  end
end
