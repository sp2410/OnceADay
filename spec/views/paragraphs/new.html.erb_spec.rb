require 'rails_helper'

RSpec.describe "paragraphs/new", type: :view do
  before(:each) do
    assign(:paragraph, Paragraph.new(
      :contents => "MyString"
    ))
  end

  it "renders new paragraph form" do
    render

    assert_select "form[action=?][method=?]", paragraphs_path, "post" do

      assert_select "input[name=?]", "paragraph[contents]"
    end
  end
end
