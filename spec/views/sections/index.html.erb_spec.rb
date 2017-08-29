require 'rails_helper'

RSpec.describe "sections/index", type: :view do
  before(:each) do
    assign(:sections, [
      Section.create!(
        :content_type => "Content Type",
        :contents => "Contents",
        :external_url => "External Url"
      ),
      Section.create!(
        :content_type => "Content Type",
        :contents => "Contents",
        :external_url => "External Url"
      )
    ])
  end

  it "renders a list of sections" do
    render
    assert_select "tr>td", :text => "Content Type".to_s, :count => 2
    assert_select "tr>td", :text => "Contents".to_s, :count => 2
    assert_select "tr>td", :text => "External Url".to_s, :count => 2
  end
end
