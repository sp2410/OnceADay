require 'rails_helper'

RSpec.describe "subjects/new", type: :view do
  before(:each) do
    assign(:subject, Subject.new(
      :title => "MyString"
    ))
  end

  it "renders new subject form" do
    render

    assert_select "form[action=?][method=?]", subjects_path, "post" do

      assert_select "input[name=?]", "subject[title]"
    end
  end
end
