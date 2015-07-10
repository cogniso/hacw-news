News::Engine.routes.draw do
  root to: 'stories#index'
  get 'seed'=>'stories#seed'
  get 'submit'=>'stories#new'
  get 'new' => 'stories#new'
  get 'comments' => 'stories#comments'

  resources :stories

  # resources :votes, only: [:create]
  get '/votes'=> 'votes#create', as: :votes
end
