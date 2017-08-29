require 'rails_helper'

RSpec.describe "audios/new", type: :view do
  before(:each) do
    assign(:audio, Audio.new(
      :contenturl => "MyString"
    ))
  end

  it "renders new audio form" do
    render

    assert_select "form[action=?][method=?]", audios_path, "post" do

      assert_select "input[name=?]", "audio[contenturl]"
    end
  end
end
