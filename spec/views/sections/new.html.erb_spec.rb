require 'rails_helper'

RSpec.describe "sections/new", type: :view do
  before(:each) do
    assign(:section, Section.new(
      :content_type => "MyString",
      :contents => "MyString",
      :external_url => "MyString"
    ))
  end

  it "renders new section form" do
    render

    assert_select "form[action=?][method=?]", sections_path, "post" do

      assert_select "input[name=?]", "section[content_type]"

      assert_select "input[name=?]", "section[contents]"

      assert_select "input[name=?]", "section[external_url]"
    end
  end
end
