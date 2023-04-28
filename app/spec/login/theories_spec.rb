# frozen_string_literal: true

require 'rails_helper'

root_path = '/init'

RSpec.describe TheoriesController, type: :controller do
  describe 'updates' do
    context 'when user is not logged in and try to updates an Theorys' do
      it 'redirects to the root path' do
        theory = Theory.create(name: 'Theory test', description: 'Description for theory test')
        get :update, params: { id: theory.id, theory: { description: 'New description for theory test' } }
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to match(/Log in is required. You do not have rights to perform that action. If you believe you have the rights, please log in with your account./)
        theory.destroy
      end
    end
  end

  describe 'destroys' do
    context 'when user is not logged in and try to destroys an Theorys' do
      it 'redirects to the root path' do
        theory = Theory.create(name: 'Theory test', description: 'Description for theory test')
        get :destroy, params: { id: theory.id }
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to match(/Log in is required. You do not have rights to perform that action. If you believe you have the rights, please log in with your account./)
        theory.destroy
      end
    end
  end

  describe 'creates' do
    context 'when user is not logged in and try to create an theory' do
      it 'redirects to the root path' do
        get :create
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to match(/Log in is required. You do not have rights to perform that action. If you believe you have the rights, please log in with your account./)
      end
    end
    context 'when user is logged in' do
      before do
        sign_in_as_test_user
      end

      it 'allow to create' do
        get :create, params: { theory: { name: 'Theory 1',
                                         description: 'Description for Theory 1' } }

        theory1 = Theory.find_by(name: 'Theory 1')

        expect(response).to redirect_to theory_path(theory1)
        expect(flash[:notice]).to match(/Theory was successfully created./)
      end
    end
  end
end
