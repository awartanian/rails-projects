Rails.application.routes.draw do
  get 'users/create'
  get 'users/destroy'
  resources :projects do
    resources :users
  end
end
