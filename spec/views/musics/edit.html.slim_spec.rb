require 'rails_helper'

RSpec.describe "musics/edit", :type => :view do
  before(:each) do
    @music = assign(:music, Music.create!(
      :title => "MyString",
      :user_id => "MyString",
      :src => "MyString"
    ))
  end

  it "renders the edit music form" do
    render

    assert_select "form[action=?][method=?]", music_path(@music), "post" do

      assert_select "input#music_title[name=?]", "music[title]"

      assert_select "input#music_user_id[name=?]", "music[user_id]"

      assert_select "input#music_src[name=?]", "music[src]"
    end
  end
end
