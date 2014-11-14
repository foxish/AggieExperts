AggieExperts::Application.routes.draw do
  match '/' => 'home#index'
  match '/search' => 'search#search'
  resources :users

  get '/admin/main' => 'admin#main'
  post '/admin/approve_all' => 'admin#approve_all'
  post '/admin/add_user' => 'admin#add_users'
  post '/admin/delete_user' => 'admin#delete_user'
  post '/admin/disable_user' => 'admin#disable_user'
  post '/admin/resend_act_user' => 'admin#resend_activation'
  post '/admin/approve_user' => 'admin#approve_user'
end
