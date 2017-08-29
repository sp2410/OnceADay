require 'rails_helper'

RSpec.describe "videos/index", type: :view do
  before(:each) do
    assign(:videos, [
      Video.create!(
        :contenturl => "Contenturl"
      ),
      Video.create!(
        :contenturl => "Contenturl"
      )
    ])
  end

  it "renders a list of videos" do
    render
    assert_select "tr>td", :text => "Contenturl".to_s, :count => 2
  end
end
