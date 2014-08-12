require 'rails_helper'

RSpec.describe "articles/index", :type => :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :title => "Title",
        :user_id => 1,
        :text => "Text"
      ),
      Article.create!(
        :title => "Title",
        :user_id => 1,
        :text => "Text"
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
