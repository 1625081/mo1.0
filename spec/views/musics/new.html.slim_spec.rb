require 'rails_helper'

RSpec.describe "musics/new", :type => :view do
  before(:each) do
    assign(:music, Music.new(
      :title => "MyString",
      :user_id => "MyString",
      :src => "MyString"
    ))
  end

  it "renders new music form" do
    render

    assert_select "form[action=?][method=?]", musics_path, "post" do

      assert_select "input#music_title[name=?]", "music[title]"

      assert_select "input#music_user_id[name=?]", "music[user_id]"

      assert_select "input#music_src[name=?]", "music[src]"
    end
  end
end
