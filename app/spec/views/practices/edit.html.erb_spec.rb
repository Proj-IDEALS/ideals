require 'rails_helper'

RSpec.describe "practices/edit", type: :view do
  let(:practice) {
    Practice.create!(
      name: "MyString",
      description: "MyString"
    )
  }

  before(:each) do
    assign(:practice, practice)
  end

  it "renders the edit practice form" do
    render

    assert_select "form[action=?][method=?]", practice_path(practice), "post" do

      assert_select "input[name=?]", "practice[name]"

      assert_select "input[name=?]", "practice[description]"
    end
  end
end
