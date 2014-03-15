DbcOverflow::Application.routes.draw do
  root :to => 'questions#index'


  resources :users
  resources :sessions,  :only => [:create, :destroy]
  resources :questions, except: [:destroy] do
    resources :comments, except: [:destroy]
    resources :answers, except: [:destroy]
  end

  resources :comments,   :only => [:destroy]

  resources :answers, only: [] do
    resources :comments, except: [:destroy]
  end

end