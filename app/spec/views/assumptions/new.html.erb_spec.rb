# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'assumptions/new', type: :view do
  before { sign_in_as_test_user }
  before(:each) do
    assign(:assumption, Assumption.new(
                          name: 'MyString',
                          description: 'MyString'
                        ))
  end

  it 'renders new assumption form' do
    render

    assert_select 'form[action=?][method=?]', assumptions_path, 'post' do
      assert_select 'input[name=?]', 'assumption[name]'

      assert_select 'input[name=?]', 'assumption[description]'
    end
  end
end
