require 'rails_helper'

RSpec.describe "newobjects/edit", type: :view do
  let(:newobject) {
    Newobject.create!(
      Name: "MyString",
      Category: "MyString",
      Details: "MyText"
    )
  }

  before(:each) do
    assign(:newobject, newobject)
  end

  it "renders the edit newobject form" do
    render

    assert_select "form[action=?][method=?]", newobject_path(newobject), "post" do

      assert_select "input[name=?]", "newobject[Name]"

      assert_select "input[name=?]", "newobject[Category]"

      assert_select "textarea[name=?]", "newobject[Details]"
    end
  end
end
