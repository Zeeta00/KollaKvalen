Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#index"

  get '/search', to: 'home#search'
  get '/selectedRider', to: 'home#filter'
  # Defines the root path route ("/")
  # root "articles#index"
end
