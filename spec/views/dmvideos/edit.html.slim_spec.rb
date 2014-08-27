require 'rails_helper'

RSpec.describe "dmvideos/edit", :type => :view do
  before(:each) do
    @dmvideo = assign(:dmvideo, Dmvideo.create!(
      :title => "MyString",
      :user_id => 1,
      :tudouid => "MyString"
    ))
  end

  it "renders the edit dmvideo form" do
    render

    assert_select "form[action=?][method=?]", dmvideo_path(@dmvideo), "post" do

      assert_select "input#dmvideo_title[name=?]", "dmvideo[title]"

      assert_select "input#dmvideo_user_id[name=?]", "dmvideo[user_id]"

      assert_select "input#dmvideo_tudouid[name=?]", "dmvideo[tudouid]"
    end
  end
end
