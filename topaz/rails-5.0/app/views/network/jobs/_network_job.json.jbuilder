json.extract! network_job, :id, :priority, :size, :downloaded, :status, :message, :long_message, :access_id, :created_at, :updated_at
json.url network_job_url(network_job, format: :json)