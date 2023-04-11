# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MapController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #all' do
    it 'returns a JSON object containing nodes' do
      # Create records for main models
      assumptions = create_list(:assumption, 3)
      theories = create_list(:theory, 2)
      practices = create_list(:practice, 4)

      # Create records for join tables through associations
      assumptions[0].theories << theories[0]
      assumptions[0].practices << practices[0]
      assumptions[1].theories << theories[1]
      assumptions[1].practices << practices[1]
      assumptions[2].theories << theories[0]
      assumptions[2].practices << practices[2]

      get :all

      # Add assertions for checking the JSON response
    end
  end
end
