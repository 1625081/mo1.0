require 'rails_helper'

RSpec.describe "articles/new", :type => :view do
  before(:each) do
    assign(:article, Article.new(
      :title => "MyString",
      :content => "MyText",
      :user => nil,
      :cover => "MyString"
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input#article_title[name=?]", "article[title]"

      assert_select "textarea#article_content[name=?]", "article[content]"

      assert_select "input#article_user_id[name=?]", "article[user_id]"

      assert_select "input#article_cover[name=?]", "article[cover]"
    end
  end
end
