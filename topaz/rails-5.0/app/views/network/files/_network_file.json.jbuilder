json.extract! network_file, :id, :full_path, :port, :url, :host_id, :path_id, :created_at, :updated_at
json.url network_file_url(network_file, format: :json)