require 'rails_helper'

RSpec.describe "musics/index", :type => :view do
  before(:each) do
    assign(:musics, [
      Music.create!(
        :title => "Title",
        :user_id => "User",
        :src => "Src"
      ),
      Music.create!(
        :title => "Title",
        :user_id => "User",
        :src => "Src"
      )
    ])
  end

  it "renders a list of musics" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => "Src".to_s, :count => 2
  end
end
