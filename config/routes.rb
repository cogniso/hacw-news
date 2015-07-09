News::Engine.routes.draw do
  root to: 'stories#index'
  get '/seed'=>'stories#seed'
  get '/submit'=>'stories#new'
  resources :stories
end
