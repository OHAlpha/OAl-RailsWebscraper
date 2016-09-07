Rails.application.routes.draw do
  namespace :network do
    resources :checksums
  end
  namespace :network do
    resources :checksum_types
  end
  namespace :network do
    resources :header_inclusions
  end
  namespace :network do
    resources :header_sets
  end
  namespace :network do
    resources :headers
  end
  namespace :network do
    resources :avenues
  end
  namespace :network do
    resources :files
  end
  namespace :network do
    resources :paths
  end
  namespace :network do
    resources :hosts
  end
  namespace :network do
    resources :domains
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
