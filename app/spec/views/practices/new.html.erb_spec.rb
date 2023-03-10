require 'rails_helper'

RSpec.describe "practices/new", type: :view do
  before(:each) do
    assign(:practice, Practice.new(
      name: "MyString",
      description: "MyString"
    ))
  end

  it "renders new practice form" do
    render

    assert_select "form[action=?][method=?]", practices_path, "post" do

      assert_select "input[name=?]", "practice[name]"

      assert_select "input[name=?]", "practice[description]"
    end
  end
end
