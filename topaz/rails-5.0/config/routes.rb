Rails.application.routes.draw do
  
  get 'debug/home'
  get 'debug/index'

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
    root 'content#home'
    get 'home' => 'content#home'
    get 'index' => 'content#index'
    resources :html_links
    resources :content_uses
    resources :content_documents
    resources :images
    resources :html_documents
    resources :contents
    resources :documents
  end

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