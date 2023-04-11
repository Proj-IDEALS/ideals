# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'practices/edit', type: :view do
  before { sign_in_as_test_user }
  let(:practice) do
    Practice.create!(
      name: 'MyString',
      description: 'MyString'
    )
  end

  before(:each) do
    assign(:practice, practice)
  end

  it 'renders the edit practice form' do
    render

    assert_select 'form[action=?][method=?]', practice_path(practice), 'post' do
      assert_select 'input[name=?]', 'practice[name]'

      assert_select 'input[name=?]', 'practice[description]'
    end
  end
end
