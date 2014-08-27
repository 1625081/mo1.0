require 'rails_helper'

RSpec.describe "dmvideos/new", :type => :view do
  before(:each) do
    assign(:dmvideo, Dmvideo.new(
      :title => "MyString",
      :user_id => 1,
      :tudouid => "MyString"
    ))
  end

  it "renders new dmvideo form" do
    render

    assert_select "form[action=?][method=?]", dmvideos_path, "post" do

      assert_select "input#dmvideo_title[name=?]", "dmvideo[title]"

      assert_select "input#dmvideo_user_id[name=?]", "dmvideo[user_id]"

      assert_select "input#dmvideo_tudouid[name=?]", "dmvideo[tudouid]"
    end
  end
end
