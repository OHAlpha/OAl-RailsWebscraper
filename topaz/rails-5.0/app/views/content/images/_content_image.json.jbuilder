json.extract! content_image, :id, :width, :height, :created_at, :updated_at
json.url content_image_url(content_image, format: :json)