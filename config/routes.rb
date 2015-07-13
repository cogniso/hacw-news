News::Engine.routes.draw do
  root to: 'stories#index'
  get 'seed'=>'stories#seed'
  get 'submit'=>'stories#new'
  get 'new' => 'stories#new'

  resources :stories
  resources :comments, only: [:new, :create]

  resources :votes, only: [:create] do
    get '/'=>'votes#create'
  end
end
