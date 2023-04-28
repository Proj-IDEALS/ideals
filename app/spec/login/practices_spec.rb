# frozen_string_literal: true

require 'rails_helper'

root_path = '/init'

RSpec.describe PracticesController, type: :controller do
  describe 'updates' do
    context 'when user is not logged in and try to updates an Practices' do
      it 'redirects to the root path' do
        practice = Practice.create(name: 'Practice test', description: 'Description for practice test')
        get :update, params: { id: practice.id, practice: { description: 'New description for practice test' } }
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to match(/Log in is required. You do not have rights to perform that action. If you believe you have the rights, please log in with your account./)
        practice.destroy
      end
    end
  end

  describe 'destroys' do
    context 'when user is not logged in and try to destroys an Practices' do
      it 'redirects to the root path' do
        practice = Practice.create(name: 'Practice test', description: 'Description for practice test')
        get :destroy, params: { id: practice.id }
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to match(/Log in is required. You do not have rights to perform that action. If you believe you have the rights, please log in with your account./)
        practice.destroy
      end
    end
  end

  describe 'creates' do
    context 'when user is not logged in and try to create an practice' do
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

      it 'renders the index template' do
        get :create, params: { practice: { name: 'Practice 1',
                                           description: 'Description for Practice 1' } }

        practice1 = Practice.find_by(name: 'Practice 1')

        expect(response).to redirect_to practice_path(practice1)
        expect(flash[:notice]).to match(/Practice was successfully created./)
      end
    end
  end
end
