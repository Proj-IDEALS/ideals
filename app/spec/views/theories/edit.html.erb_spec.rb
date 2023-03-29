require 'rails_helper'

RSpec.describe "theories/edit", type: :view do
  before { sign_in_as_test_user }
  let(:theory) {
    Theory.create!(
      name: "MyString",
      description: "MyString"
    )
  }

  before(:each) do
    assign(:theory, theory)
  end

  it "renders the edit theory form" do
    render

    assert_select "form[action=?][method=?]", theory_path(theory), "post" do

      assert_select "input[name=?]", "theory[name]"

      assert_select "input[name=?]", "theory[description]"
    end
  end
end
