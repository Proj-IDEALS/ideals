# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TheoriesController, type: :controller do
  before { sign_in_as_test_user }
  describe 'creates' do
    it 'theory with valid parameters' do
      get :create, params: { theory: { name: 'Theory 1',
                                       description: 'Description for Theory 1' } }

      theory1 = Theory.find_by(name: 'Theory 1')

      expect(response).to redirect_to theory_path(theory1)
      expect(flash[:notice]).to match(/Theory was successfully created./)
    end

    it 'fail when given empty name' do
      get :create, params: { theory: { name: '', description: 'Description' } }
      expect(response).to be_client_error
      expect(assigns(:theory).errors[:name]).to include("can't be blank")
    end
  end

  describe 'updates' do
    it 'redirects to the theories details page and flashes a notice' do
      theory = Theory.create(name: 'Theory test', description: 'Description for theory test')
      get :update, params: { id: theory.id, theory: { description: 'New description for theory test' } }

      expect(response).to redirect_to theory_path(theory)
      expect(flash[:notice]).to match(/Theory was successfully updated./)
      theory.destroy
    end

    it 'actually does the update' do
      theory = Theory.create(name: 'Theory Test', description: 'Description for theory test')
      get :update, params: { id: theory.id, theory: { description: 'New Description' } }

      expect(assigns(:theory).description).to eq('New Description')
      theory.destroy
    end
  end

  describe 'destroys' do
    it 'theories with valid parameters' do
      theory = Theory.create(name: 'Theory test', description: 'Description for theory test')
      get :destroy, params: { id: theory.id }
      expect(response).to redirect_to theories_path
      expect(flash[:notice]).to match(/Theory was successfully destroyed./)
    end
  end
end
