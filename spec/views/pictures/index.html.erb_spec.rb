require 'rails_helper'

RSpec.describe "pictures/index", type: :view do
  before(:each) do
    assign(:pictures, [
      Picture.create!(
        :picurl => "Picurl"
      ),
      Picture.create!(
        :picurl => "Picurl"
      )
    ])
  end

  it "renders a list of pictures" do
    render
    assert_select "tr>td", :text => "Picurl".to_s, :count => 2
  end
end
