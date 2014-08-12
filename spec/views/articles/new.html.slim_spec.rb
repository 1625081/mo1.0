require 'rails_helper'

RSpec.describe "articles/new", :type => :view do
  before(:each) do
    assign(:article, Article.new(
      :title => "MyString",
      :user_id => 1,
      :text => "MyString"
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input#article_title[name=?]", "article[title]"

      assert_select "input#article_user_id[name=?]", "article[user_id]"

      assert_select "input#article_text[name=?]", "article[text]"
    end
  end
end
