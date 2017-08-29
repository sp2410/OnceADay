require 'rails_helper'

RSpec.describe "codes/index", type: :view do
  before(:each) do
    assign(:codes, [
      Code.create!(
        :contents => "Contents"
      ),
      Code.create!(
        :contents => "Contents"
      )
    ])
  end

  it "renders a list of codes" do
    render
    assert_select "tr>td", :text => "Contents".to_s, :count => 2
  end
end
