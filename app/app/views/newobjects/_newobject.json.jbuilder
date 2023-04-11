# frozen_string_literal: true

json.extract! newobject, :id, :Name, :Category, :Details, :created_at, :updated_at
json.url newobject_url(newobject, format: :json)
