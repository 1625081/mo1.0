require "rails_helper"

RSpec.describe User, :type => :model do
  it "can create user" do
    spiderman = User.create!(email: 'spiderman@test.com', username: 'spiderman', password: 'asdfghjkl', password_confirmation: 'asdfghjkl')

    expect(User.where('username = ?', 'spiderman').last).to eq(spiderman)
  end

  it 'can inform the identity' do
    spiderman = User.create!(email: 'spiderman@test.com', username: 'spiderman', password: 'asdfghjkl', password_confirmation: 'asdfghjkl')
    batman = User.create!(email: 'batman@test.com', username: 'batman', password: 'asdfghjkl', password_confirmation: 'asdfghjkl', power: 1)
    iconman = User.create!(email: 'iconman@test.com', username: 'iconman', password: 'asdfghjkl', password_confirmation: 'asdfghjkl', power: 2)
    cassiuschen = User.create!(email: 'cassiuschen@test.com', username: 'cassiuschen', password: 'asdfghjkl', password_confirmation: 'asdfghjkl', power: 3)
    users = [spiderman, batman, iconman, cassiuschen]


    expect(users.map {|u| u.power}).to eq(['user', 'editor', 'leader', 'admin'])
  end

  it 'can work out nickname' do
    spiderman = User.create!(email: 'spiderman@test.com', username: 'spiderman', password: 'asdfghjkl', password_confirmation: 'asdfghjkl')
    batman = User.create!(email: 'batman@test.com', username: 'batman', password: 'asdfghjkl', password_confirmation: 'asdfghjkl', power: 1)
    result = []
    batman.profile.nickname = "Bat Man"
    result << spiderman.nickname
    result << batman.nickname

    expect(result).to eq(["spiderman", "Bat Man"])
  end
end