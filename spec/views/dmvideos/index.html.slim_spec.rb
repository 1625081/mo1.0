require 'rails_helper'

RSpec.describe "dmvideos/index", :type => :view do
  before(:each) do
    assign(:dmvideos, [
      Dmvideo.create!(
        :title => "Title",
        :user_id => 1,
        :tudouid => "Tudouid"
      ),
      Dmvideo.create!(
        :title => "Title",
        :user_id => 1,
        :tudouid => "Tudouid"
      )
    ])
  end

  it "renders a list of dmvideos" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Tudouid".to_s, :count => 2
  end
end
