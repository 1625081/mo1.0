require 'rails_helper'

RSpec.describe "dmvideos/show", :type => :view do
  before(:each) do
    @dmvideo = assign(:dmvideo, Dmvideo.create!(
      :title => "Title",
      :user_id => 1,
      :tudouid => "Tudouid"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Tudouid/)
  end
end
