Rails.application.routes.draw do
  resources :projects do
    resources :users
    resources :team_lead_user
  end
end
