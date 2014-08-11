require 'rails_helper'

RSpec.describe "musics/show", :type => :view do
  before(:each) do
    @music = assign(:music, Music.create!(
      :title => "Title",
      :user_id => "User",
      :src => "Src"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/User/)
    expect(rendered).to match(/Src/)
  end
end
