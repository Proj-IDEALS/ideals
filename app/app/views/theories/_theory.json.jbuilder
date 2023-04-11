# frozen_string_literal: true

json.extract! theory, :id, :name, :description, :created_at, :updated_at
json.url theory_url(theory, format: :json)
