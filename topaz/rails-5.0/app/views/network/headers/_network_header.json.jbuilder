json.extract! network_header, :id, :header_name, :header_value, :created_at, :updated_at
json.url network_header_url(network_header, format: :json)