json.extract! client, :id, :name, :callback_url, :auth_key, :created_at, :updated_at
json.url client_url(client, format: :json)
