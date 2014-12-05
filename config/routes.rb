AggieExperts::Application.routes.draw do
  resources :passwords, controller: 'passwords', only: [:create, :new]
  resource :session, controller: 'sessions', only: [:create]
  resources :users, controller: 'users', only: [:create] do
    resource :password,
      controller: 'passwords',
      only: [:create, :edit, :update]
  end

  delete '/sign_out'             => 'sessions#destroy', as: 'sign_out'
  get    '/sign_up'              => 'users#new',        as: 'sign_up'
  root  :to                      => "home#index"
  get   '/search'                => 'search#search'
  get   '/admin/main'            => 'admin#main'
  post  '/admin/approve_all'     => 'admin#approve_all'
  post  '/admin/add_user'        => 'admin#add_users'
  post  '/admin/delete_user'     => 'admin#delete_user'
  post  '/admin/disable_user'    => 'admin#disable_user'
  post  '/admin/resend_act_user' => 'admin#resend_activation'
  post  '/admin/approve_user'    => 'admin#approve_user'
  post  '/admin/delete_suser'    => 'admin#delete_suser'
  get   'activate'           => 'users#new'
  resources :profile
end
