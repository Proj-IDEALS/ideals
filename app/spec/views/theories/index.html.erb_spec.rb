require 'rails_helper'

RSpec.describe "theories/index", type: :view do
  before(:each) do
    assign(:theories, [
      Theory.create!(
        name: "Name",
        description: "Description"
      ),
      Theory.create!(
        name: "Name",
        description: "Description"
      )
    ])
  end

  it "renders a list of theories" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
  end
end
