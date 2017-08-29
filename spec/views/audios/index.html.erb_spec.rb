require 'rails_helper'

RSpec.describe "audios/index", type: :view do
  before(:each) do
    assign(:audios, [
      Audio.create!(
        :contenturl => "Contenturl"
      ),
      Audio.create!(
        :contenturl => "Contenturl"
      )
    ])
  end

  it "renders a list of audios" do
    render
    assert_select "tr>td", :text => "Contenturl".to_s, :count => 2
  end
end
