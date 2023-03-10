require 'rails_helper'

RSpec.describe "theories/new", type: :view do
  before(:each) do
    assign(:theory, Theory.new(
      name: "MyString",
      description: "MyString"
    ))
  end

  it "renders new theory form" do
    render

    assert_select "form[action=?][method=?]", theories_path, "post" do

      assert_select "input[name=?]", "theory[name]"

      assert_select "input[name=?]", "theory[description]"
    end
  end
end
