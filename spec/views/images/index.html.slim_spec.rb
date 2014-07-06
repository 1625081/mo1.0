require 'rails_helper'

RSpec.describe "images/index", :type => :view do
  before(:each) do
    assign(:images, [
      Image.create!(
        :score => 1.5,
        :file => "File",
        :like => 1,
        :favorate => 2,
        :public => false,
        :title => "Title",
        :description => "MyText"
      ),
      Image.create!(
        :score => 1.5,
        :file => "File",
        :like => 1,
        :favorate => 2,
        :public => false,
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of images" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "File".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
