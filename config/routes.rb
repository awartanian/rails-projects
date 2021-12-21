Rails.application.routes.draw do
  get 'sessions/new'
  resources :projects do
    resources :updates

    member do
      post :add_user
      post :make_team_lead
      delete :remove_user
    end

    # collection do
    #   post :another_action
    # end
  end


  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions

  root to: 'projects#index'
end
