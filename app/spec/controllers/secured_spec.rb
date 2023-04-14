# spec/controllers/secured_spec.rb
require 'rails_helper'

RSpec.describe TestController, type: :controller do
  before do
    Rails.application.routes.draw do
      get 'test', to: 'test#index'
    end
  end

  after do
    Rails.application.reload_routes!
  end

  describe 'Secured concern' do
    context 'when not logged in' do
      it 'redirects to the root path with an alert message' do
        get :index
        expect(response).to redirect_to('/')
        expect(flash[:alert]).to eq('Log in is required. You do not have rights to perform that action. If you believe you have the rights, please log in with your account.')
      end
    end

    context 'when logged in' do
      before do
        session[:userinfo] = { 'email' => 'test@example.com' }
      end

      it 'does not redirect and allows access to the action' do
        get :index
        expect(response).to have_http_status(:ok)
        expect(response.body).to eq('Test controller index action')
      end
    end
  end
end
