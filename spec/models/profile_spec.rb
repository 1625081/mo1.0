require "rails_helper"

RSpec.describe Profile, :type => :model do
  it "can be changed" do
    spiderman = User.create!(email: 'spiderman@test.com', username: 'spiderman', password: 'asdfghjkl', password_confirmation: 'asdfghjkl')
    spiderman.profile = Profile.new(nickname: '')
    spiderman.profile.nickname = "Spider Man"
    spiderman.save

    expect(spiderman.profile.nickname).to eq("Spider Man")
  end
end