require 'rails_helper'

RSpec.describe "newobjects/new", type: :view do
  before(:each) do
    assign(:newobject, Newobject.new(
      Name: "MyString",
      Category: "MyString",
      Details: "MyText"
    ))
  end

  it "renders new newobject form" do
    render

    assert_select "form[action=?][method=?]", newobjects_path, "post" do

      assert_select "input[name=?]", "newobject[Name]"

      assert_select "input[name=?]", "newobject[Category]"

      assert_select "textarea[name=?]", "newobject[Details]"
    end
  end
end
