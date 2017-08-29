require 'rails_helper'

RSpec.describe "pictures/edit", type: :view do
  before(:each) do
    @picture = assign(:picture, Picture.create!(
      :picurl => "MyString"
    ))
  end

  it "renders the edit picture form" do
    render

    assert_select "form[action=?][method=?]", picture_path(@picture), "post" do

      assert_select "input[name=?]", "picture[picurl]"
    end
  end
end