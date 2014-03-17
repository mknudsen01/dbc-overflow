DbcOverflow::Application.routes.draw do
  root :to => 'questions#index'

  concern :commentable do
    resources :comments, except: [:destroy]
  end

  concern :voteable do
    post 'upvote' => 'votes#upvote'
    post 'downvote' => 'votes#downvote'
  end

  post 'search' => 'searches#search'
  post "/questions/:id/mark_best_answer/:answer_id" => 'questions#mark_best_answer'

  resources :users
  resources :sessions,  :only => [:create, :destroy]
  resources :questions, except: [:destroy], concerns: [:commentable, :voteable]  do
    resources :answers, except: [:destroy]
  end

  resources :comments,   :only => [:destroy], concerns: :voteable

  resources :answers, only: [], concerns: [:commentable, :voteable]

end