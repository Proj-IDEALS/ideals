require 'rails_helper'

RSpec.describe "newobjects/show", type: :view do
  before(:each) do
    assign(:newobject, Newobject.create!(
      Name: "Name",
      Category: "Category",
      Details: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/MyText/)
  end
end
