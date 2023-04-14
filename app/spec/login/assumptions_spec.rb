# frozen_string_literal: true

require 'rails_helper'

root_path = '/init'

RSpec.describe AssumptionsController, type: :controller do
  describe 'updates' do
    context 'when user is not logged in and try to updates an assumption' do
      it 'redirects to the root path' do
        assumption = Assumption.create(name: 'Assumption test', description: 'Description for assumption test')
        get :update,
            params: { id: assumption.id, assumption: { description: 'New description for assumption test' } }
        expect(response).to redirect_to(root_path)
        assumption.destroy
      end
    end
  end

  describe 'destroys' do
    context 'when user is not logged in and try to destroys an assumption' do
      it 'redirects to the root path' do
        assumption = Assumption.create(name: 'Assumption test', description: 'Description for assumption test')
        get :destroy, params: { id: assumption.id }
        expect(response).to redirect_to(root_path)
        assumption.destroy
      end
    end
  end

  describe 'creates' do
    context 'when user is not logged in and try to create an assumption' do
      it 'redirects to the root path' do
        get :create
        expect(response).to redirect_to(root_path)
      end
    end
    context 'when user is logged in' do
      before do
        sign_in_as_test_user
      end

      it 'renders the index template' do
        get :create, params: { assumption: { name: 'Assumption 1',
                                             description: 'Description for Assumption 1' } }

        assumption1 = Assumption.find_by(name: 'Assumption 1')

        expect(response).to redirect_to assumption_path(assumption1)
        expect(flash[:notice]).to match(/Assumption was successfully created./)
      end
    end
  end
end
