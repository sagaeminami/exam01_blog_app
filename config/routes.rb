Rails.application.routes.draw do
  get '/',  to:'blogs#index'
  patch '/blogs/:id' => 'blogs#update'
  resources :favorites,only: [:create,:destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :blogs do
    collection do
    get  'favorite'
    post 'confirm'
    end
  end
end
