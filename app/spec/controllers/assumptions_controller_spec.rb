# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AssumptionsController, type: :controller do
  before { sign_in_as_test_user }
  describe 'creates' do
    it 'assumption with valid parameters' do
      get :create, params: { assumption: { name: 'Assumption 1',
                                           description: 'Description for Assumption 1' } }

      assumption1 = Assumption.find_by(name: 'Assumption 1')

      expect(response).to redirect_to assumption_path(assumption1)
      expect(flash[:notice]).to match(/Assumption was successfully created./)
    end

    it 'fail when given empty name' do
      get :create, params: { assumption: { name: '', description: 'Description' } }
      expect(response).to be_client_error
      expect(assigns(:assumption).errors[:name]).to include("can't be blank")
    end
  end

  describe 'GET #index' do
    it 'retrieves all assumptions and renders the index template' do
      assumption1 = Assumption.create!(name: 'Assumption 1', description: 'Sample assumption description 1')
      assumption2 = Assumption.create!(name: 'Assumption 2', description: 'Sample assumption description 2')

      get :index

      expect(assigns(:assumptions)).to match_array([assumption1, assumption2])
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'updates' do
    let(:valid_attributes) do
      { name: 'Assumption test', description: 'Description for assumption test' }
    end

    let(:invalid_attributes) do
      { name: '', description: 'Sample assumption description' }
    end

    it 'redirects to the assumptions details page and flashes a notice' do
      assumption = Assumption.create(name: 'Assumption test', description: 'Description for assumption test')
      get :update, params: { id: assumption.id, assumption: { description: 'New description for assumption test' } }

      expect(response).to redirect_to assumption_path(assumption)
      expect(flash[:notice]).to match(/Assumption was successfully updated./)
      assumption.destroy
    end

    it 'actually does the update' do
      assumption = Assumption.create(name: 'Assumption Test', description: 'Description for assumption test')
      get :update, params: { id: assumption.id, assumption: { description: 'New Description' } }

      expect(assigns(:assumption).description.body.to_plain_text).to eq('New Description')
      assumption.reload
      expect(assumption.description.body.to_plain_text).to eq('New Description')
      assumption.destroy
    end

    it 'does not update the assumption and returns unprocessable entity status' do
      assumption = Assumption.create! valid_attributes
      patch :update, params: { id: assumption.id, assumption: invalid_attributes }
      assumption.reload
      expect(assumption.name).to eq(valid_attributes[:name])
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:edit)
    end
  end

  describe 'destroys' do
    it 'assumptions with valid parameters' do
      assumption = Assumption.create(name: 'Assumption test', description: 'Description for assumption test')
      get :destroy, params: { id: assumption.id }
      expect(response).to redirect_to assumptions_path
      expect(flash[:notice]).to match(/Assumption was successfully destroyed./)
    end
  end
end
