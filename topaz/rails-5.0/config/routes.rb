Rails.application.routes.draw do

  get 'scraper/home' => 'scraper#home'

  get 'scraper/statistics' => 'scraper#statistics'

  get 'scraper/scrape' => 'scraper#scrape'
  post 'scraper/scrape_results'
  
  get 'scraper/make_request' => 'scraper#make_request'
  post 'scraper/request_results'
  get 'scraper/visit_url/:url' => 'scraper#visit_url'

  get 'scraper/avenue/:avenue_id' => 'scraper#avenue'
  get 'scraper/access/:access_id' => 'scraper#access'
  get 'scraper/access_response/:access_id' => 'scraper#access_response'

  get 'scraper/header_sets' => 'scraper#header_sets'
  get 'scraper/header_set/:header_set_id' => 'scraper#header_set'

  get 'scraper/documents' => 'scraper#documents'
  get 'scraper/document/:document_id' => 'scraper#document'
  get 'scraper/document_data/:document_id' => 'scraper#document_data'

  get 'scraper/contents' => 'scraper#contents'
  get 'scraper/content/:content_id' => 'scraper#content'
  get 'scraper/content_data/:content_id' => 'scraper#content_data'

  get 'scraper/pages' => 'scraper#pages'
  get 'scraper/page_map' => 'scraper#page_map'
  get 'scraper/page/:page_id' => 'scraper#page'
  get 'scraper/page_data/:page_id' => 'scraper#page_data'

  get 'scraper/images' => 'scraper#images'
  get 'scraper/image/:image_id' => 'scraper#image'
  get 'scraper/image_data/:image_id' => 'scraper#image_data'

  get 'debug/home'
  get 'debug/index'

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