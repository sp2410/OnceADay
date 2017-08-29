require 'rails_helper'

RSpec.describe "sections/edit", type: :view do
  before(:each) do
    @section = assign(:section, Section.create!(
      :content_type => "MyString",
      :contents => "MyString",
      :external_url => "MyString"
    ))
  end

  it "renders the edit section form" do
    render

    assert_select "form[action=?][method=?]", section_path(@section), "post" do

      assert_select "input[name=?]", "section[content_type]"

      assert_select "input[name=?]", "section[contents]"

      assert_select "input[name=?]", "section[external_url]"
    end
  end
end
