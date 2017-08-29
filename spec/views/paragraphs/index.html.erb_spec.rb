require 'rails_helper'

RSpec.describe "paragraphs/index", type: :view do
  before(:each) do
    assign(:paragraphs, [
      Paragraph.create!(
        :contents => "Contents"
      ),
      Paragraph.create!(
        :contents => "Contents"
      )
    ])
  end

  it "renders a list of paragraphs" do
    render
    assert_select "tr>td", :text => "Contents".to_s, :count => 2
  end
end
