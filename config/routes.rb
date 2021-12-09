Rails.application.routes.draw do
  root to: 'projects#index'
  resources :projects do
    resources :users
    resources :team_lead_user
  end
end
