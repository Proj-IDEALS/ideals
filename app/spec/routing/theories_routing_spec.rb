# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TheoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/theories').to route_to('theories#index')
    end

    it 'routes to #new' do
      expect(get: '/theories/new').to route_to('theories#new')
    end

    it 'routes to #show' do
      expect(get: '/theories/1').to route_to('theories#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/theories/1/edit').to route_to('theories#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/theories').to route_to('theories#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/theories/1').to route_to('theories#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/theories/1').to route_to('theories#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/theories/1').to route_to('theories#destroy', id: '1')
    end
  end
end
