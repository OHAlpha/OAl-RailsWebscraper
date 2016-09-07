Rails.application.routes.draw do
  namespace :network do
    resources :domains
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
