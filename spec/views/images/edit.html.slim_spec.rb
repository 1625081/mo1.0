require 'rails_helper'

RSpec.describe "images/edit", :type => :view do
  before(:each) do
    @image = assign(:image, Image.create!(
      :score => 1.5,
      :file => "MyString",
      :like => 1,
      :favorate => 1,
      :public => false,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit image form" do
    render

    assert_select "form[action=?][method=?]", image_path(@image), "post" do

      assert_select "input#image_score[name=?]", "image[score]"

      assert_select "input#image_file[name=?]", "image[file]"

      assert_select "input#image_like[name=?]", "image[like]"

      assert_select "input#image_favorate[name=?]", "image[favorate]"

      assert_select "input#image_public[name=?]", "image[public]"

      assert_select "input#image_title[name=?]", "image[title]"

      assert_select "textarea#image_description[name=?]", "image[description]"
    end
  end
end
