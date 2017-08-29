require 'rails_helper'

RSpec.describe "audios/edit", type: :view do
  before(:each) do
    @audio = assign(:audio, Audio.create!(
      :contenturl => "MyString"
    ))
  end

  it "renders the edit audio form" do
    render

    assert_select "form[action=?][method=?]", audio_path(@audio), "post" do

      assert_select "input[name=?]", "audio[contenturl]"
    end
  end
end
