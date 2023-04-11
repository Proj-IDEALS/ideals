# frozen_string_literal: true

json.extract! assumption, :id, :name, :description, :created_at, :updated_at
json.url assumption_url(assumption, format: :json)
