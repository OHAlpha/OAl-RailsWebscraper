json.extract! content_html_document, :id, :title, :links_count, :created_at, :updated_at
json.url content_html_document_url(content_html_document, format: :json)