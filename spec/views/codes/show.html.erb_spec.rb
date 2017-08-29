require 'rails_helper'

RSpec.describe "codes/show", type: :view do
  before(:each) do
    @code = assign(:code, Code.create!(
      :contents => "Contents"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Contents/)
  end
end
