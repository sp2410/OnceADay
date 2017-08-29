require 'rails_helper'

RSpec.describe "paragraphs/edit", type: :view do
  before(:each) do
    @paragraph = assign(:paragraph, Paragraph.create!(
      :contents => "MyString"
    ))
  end

  it "renders the edit paragraph form" do
    render

    assert_select "form[action=?][method=?]", paragraph_path(@paragraph), "post" do

      assert_select "input[name=?]", "paragraph[contents]"
    end
  end
end
