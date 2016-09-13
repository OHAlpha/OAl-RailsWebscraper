Rails.application.routes.draw do

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