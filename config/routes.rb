AggieExperts::Application.routes.draw do
  match '/' => 'home#index'
  match '/search' => 'search#search'
  resources :users
end
