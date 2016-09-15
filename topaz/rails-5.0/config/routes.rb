Rails.application.routes.draw do

  get 'scraper/home'

  get 'scraper/statistics'

  get 'scraper/scrape'
  get 'scraper/scrape_results'

  get 'scraper/visit_url'

  get 'scraper/avenue'
  get 'scraper/access'
  get 'scraper/access_response'

  get 'scraper/documents'
  get 'scraper/document'
  get 'scraper/document_data'

  get 'scraper/contents'
  get 'scraper/content'
  get 'scraper/content_data'

  get 'scraper/pages'
  get 'scraper/page_map'
  get 'scraper/page'
  get 'scraper/page_data'

  get 'scraper/images'
  get 'scraper/image'
  get 'scraper/image_data'

  namespace :content do
    get 'home'
  end

  namespace :content do
    get 'content/index'
  end

  namespace :content do
    resources :html_links
  end
  namespace :content do
    resources :content_uses
  end
  namespace :content do
    resources :content_documents
  end
  namespace :content do
    resources :images
  end
  namespace :content do
    resources :html_documents
  end
  namespace :content do
    resources :contents
  end
  namespace :content do
    resources :documents
  end
  get 'debug/home'

  get 'debug/index'

  namespace :network do
    root 'network#home'
    get 'home' => 'network#home'
    get 'index' => 'network#index'
    resources :jobs
    resources :accesses
    resources :checksums
    resources :checksum_types
    resources :header_inclusions
    resources :header_sets
    resources :headers
    resources :avenues
    resources :files
    resources :paths
    resources :hosts
    resources :domains
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end