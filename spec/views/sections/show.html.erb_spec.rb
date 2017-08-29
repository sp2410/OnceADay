require 'rails_helper'

RSpec.describe "sections/show", type: :view do
  before(:each) do
    @section = assign(:section, Section.create!(
      :content_type => "Content Type",
      :contents => "Contents",
      :external_url => "External Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Content Type/)
    expect(rendered).to match(/Contents/)
    expect(rendered).to match(/External Url/)
  end
end
