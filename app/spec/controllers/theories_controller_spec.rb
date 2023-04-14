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

  describe 'GET #index' do
    it 'retrieves all theories and renders the index template' do
      theory1 = Theory.create!(name: 'Theory 1', description: 'Sample theory description 1')
      theory2 = Theory.create!(name: 'Theory 2', description: 'Sample theory description 2')

      get :index

      expect(assigns(:theories)).to match_array([theory1, theory2])
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'updates' do
    let(:valid_attributes) do
      { name: 'Theory test', description: 'Description for theory test' }
    end

    let(:invalid_attributes) do
      { name: '', description: 'Sample theory description' }
    end

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

      expect(assigns(:theory).description.body.to_plain_text).to eq('New Description')
      theory.reload
      expect(theory.description.body.to_plain_text).to eq('New Description')
      theory.destroy
    end

    it 'does not update the theory and returns unprocessable entity status' do
      theory = Theory.create! valid_attributes
      patch :update, params: { id: theory.id, theory: invalid_attributes }
      theory.reload
      expect(theory.name).to eq(valid_attributes[:name])
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:edit)
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
