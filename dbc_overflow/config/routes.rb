DbcOverflow::Application.routes.draw do
  root :to => 'users#index'
  resources :users

  resources :questions, except: => [:destroy] do
    resources :answers, except: => [:destroy]
  end
end
