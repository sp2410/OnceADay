require 'rails_helper'

RSpec.describe "audios/show", type: :view do
  before(:each) do
    @audio = assign(:audio, Audio.create!(
      :contenturl => "Contenturl"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Contenturl/)
  end
end
