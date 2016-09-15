Rails.application.routes.draw do
  
  get 'debug/home'

  get 'debug/index'

  namespace :content do
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