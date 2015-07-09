News::Engine.routes.draw do
  root to: 'stories#index'
  get 'seed'=>'stories#seed'
  get 'submit'=>'stories#new'
  get 'new' => 'stories#new'
  resources :stories do
    get :vote, on: :member
  end
end
