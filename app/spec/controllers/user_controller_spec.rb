# frozen_string_literal: true

# spec/controllers/user_controller_spec.rb

require 'rails_helper'

RSpec.describe UserController, type: :controller do
  let(:user_info) do
    {
      'name' => 'John Doe',
      'email' => 'john.doe@example.com',
      'image' => 'http://example.com/image.jpg'
    }
  end

  let(:provider) { 'auth0' }
  let(:uid) { '1234567890' }
  let(:info) { 'extra info' }

  before do
    # Stub the Secured module methods to simulate a logged-in user
    allow(controller).to receive(:logged_in_using_omniauth?).and_return(true)

    # Set session data
    session[:userinfo] = user_info
    session[:provider] = provider
    session[:uid] = uid
    session[:info] = info
  end

  describe 'GET #show' do
    it 'retrieves user information from the session and renders the show template' do
      get :show

      expect(assigns(:user)).to eq(user_info)
      expect(assigns(:provider)).to eq(provider)
      expect(assigns(:uid)).to eq(uid)
      expect(assigns(:info)).to eq(info)

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end
end
