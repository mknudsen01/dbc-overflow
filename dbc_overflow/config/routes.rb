DbcOverflow::Application.routes.draw do
  root :to => 'users#index'

  post 'users/process_login', :to => 'users#process_login'
  get 'users/logout', :to => 'users#logout'
  resources :users

end