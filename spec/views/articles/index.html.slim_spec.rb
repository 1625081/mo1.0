require 'rails_helper'

RSpec.describe "articles/index", :type => :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :title => "Title",
        :content => "MyText",
        :user => nil,
        :cover => "Cover"
      ),
      Article.create!(
        :title => "Title",
        :content => "MyText",
        :user => nil,
        :cover => "Cover"
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Cover".to_s, :count => 2
  end
end
