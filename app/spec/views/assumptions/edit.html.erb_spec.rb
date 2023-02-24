require 'rails_helper'

RSpec.describe "assumptions/edit", type: :view do
  let(:assumption) {
    Assumption.create!(
      name: "MyString",
      description: "MyString"
    )
  }

  before(:each) do
    assign(:assumption, assumption)
  end

  it "renders the edit assumption form" do
    render

    assert_select "form[action=?][method=?]", assumption_path(assumption), "post" do

      assert_select "input[name=?]", "assumption[name]"

      assert_select "input[name=?]", "assumption[description]"
    end
  end
end
