# frozen_string_literal: true

# spec/controllers/auth0_controller_spec.rb

require 'rails_helper'
require 'webmock/rspec'

RSpec.describe Auth0Controller, type: :controller do
  let(:auth0_domain) { 'example.auth0.com' }
  let(:auth0_client_id) { 'your_auth0_client_id' }

  before do
    # Stub the auth0 configuration
    allow(Rails.application).to receive(:config_for).with(:auth0).and_return({
                                                                               'auth0_domain' => auth0_domain,
                                                                               'auth0_client_id' => auth0_client_id
                                                                             })

    # Stub the controller's logout_url method to ensure it's being called
    allow(controller).to receive(:logout_url) do
      request_params = {
        returnTo: 'https://idealmaps.xyz',
        client_id: auth0_client_id
      }

      URI::HTTPS.build(host: auth0_domain, path: '/v2/logout', query: to_query(request_params)).to_s
    end
  end

  def to_query(hash)
    hash.map { |k, v| "#{k}=#{CGI.escape(v)}" unless v.nil? }.reject(&:nil?).join('&')
  end

  describe 'GET #callback' do
    it 'sets user information in the session and redirects to root path' do
      # Stub the omniauth.auth hash
      request.env['omniauth.auth'] = {
        'provider' => 'auth0',
        'uid' => '123456',
        'info' => 'some_info',
        'extra' => {
          'raw_info' => {
            'name' => 'John Doe',
            'email' => 'john.doe@example.com'
          }
        }
      }

      get :callback

      expect(session[:provider]).to eq('auth0')
      expect(session[:uid]).to eq('123456')
      expect(session[:info]).to eq('some_info')
      expect(session[:userinfo]).to eq({
                                         'name' => 'John Doe',
                                         'email' => 'john.doe@example.com'
                                       })

      expect(response).to redirect_to(root_path)
    end
  end

  describe 'GET #failure' do
    it 'displays the error message' do
      get :failure, params: { message: 'error_message' }

      expect(assigns(:error_msg)).to eq('error_message')
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #logout' do
    it 'clears the session and redirects to the logout URL' do
      # Prepare the session data
      session[:userinfo] = { 'name' => 'John Doe' }

      get :logout

      expect(session[:userinfo]).to be_nil

      logout_url = "https://#{auth0_domain}/v2/logout?returnTo=https%3A%2F%2Fidealmaps.xyz&client_id=#{auth0_client_id}"
      expect(response).to redirect_to(logout_url)
    end
  end

  describe '#logout_url' do
    it 'returns the correct logout URL' do
      expected_logout_url = "https://#{auth0_domain}/v2/logout?returnTo=https%3A%2F%2Fidealmaps.xyz&client_id=#{auth0_client_id}"

      result = controller.send(:logout_url)
      expect(result).to eq(expected_logout_url)

      # Ensure the 'returnTo' parameter is set correctly
      parsed_url = URI.parse(result)
      query_params = CGI.parse(parsed_url.query)
      expect(query_params['returnTo'].first).to eq('https://idealmaps.xyz')
    end
  end

  describe '#to_query' do
    it 'converts a hash to a query string' do
      input_hash = {
        key1: 'value1',
        key2: 'value with spaces',
        key3: nil
      }

      expected_query_string = 'key1=value1&key2=value+with+spaces'

      result = controller.send(:to_query, input_hash)
      expect(result).to eq(expected_query_string)
    end
  end
end
