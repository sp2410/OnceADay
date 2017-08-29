require 'rails_helper'

RSpec.describe "paragraphs/show", type: :view do
  before(:each) do
    @paragraph = assign(:paragraph, Paragraph.create!(
      :contents => "Contents"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Contents/)
  end
end
