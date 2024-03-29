# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PracticesController, type: :controller do
  before { sign_in_as_test_user }
  describe 'creates' do
    it 'practice with valid parameters' do
      get :create, params: { practice: { name: 'Practice 1',
                                         description: 'Description for Practice 1' } }

      practice1 = Practice.find_by(name: 'Practice 1')

      expect(response).to redirect_to practice_path(practice1)
      expect(flash[:notice]).to match(/Practice was successfully created./)
    end

    it 'fail when given empty name' do
      get :create, params: { practice: { name: '', description: 'Description' } }
      expect(response).to be_client_error
      expect(assigns(:practice).errors[:name]).to include("can't be blank")
    end
  end

  describe 'GET #index' do
    it 'retrieves all practices and renders the index template' do
      practice1 = Practice.create!(name: 'Practice 1', description: 'Sample practice description 1')
      practice2 = Practice.create!(name: 'Practice 2', description: 'Sample practice description 2')

      get :index

      expect(assigns(:practices)).to match_array([practice1, practice2])
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'updates' do
    let(:valid_attributes) do
      { name: 'Practice test', description: 'Description for practice test' }
    end

    let(:invalid_attributes) do
      { name: '', description: 'Sample practice description' }
    end

    it 'redirects to the practices details page and flashes a notice' do
      practice = Practice.create(name: 'Practice test', description: 'Description for practice test')
      get :update, params: { id: practice.id, practice: { description: 'New description for practice test' } }

      expect(response).to redirect_to practice_path(practice)
      expect(flash[:notice]).to match(/Practice was successfully updated./)
      practice.destroy
    end

    it 'actually does the update' do
      practice = Practice.create(name: 'Practice Test', description: 'Description for practice test')
      get :update, params: { id: practice.id, practice: { description: 'New Description' } }

      expect(assigns(:practice).description.body.to_plain_text).to eq('New Description')
      practice.reload
      expect(practice.description.body.to_plain_text).to eq('New Description')
      practice.destroy
    end

    it 'does not update the practice and returns unprocessable entity status' do
      practice = Practice.create! valid_attributes
      patch :update, params: { id: practice.id, practice: invalid_attributes }
      practice.reload
      expect(practice.name).to eq(valid_attributes[:name])
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:edit)
    end
  end

  describe 'destroys' do
    it 'practices with valid parameters' do
      practice = Practice.create(name: 'Practice test', description: 'Description for practice test')
      get :destroy, params: { id: practice.id }
      expect(response).to redirect_to practices_path
      expect(flash[:notice]).to match(/Practice was successfully destroyed./)
    end
  end
end
