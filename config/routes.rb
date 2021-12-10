Rails.application.routes.draw do
  resources :projects do
    member do
      post :add_user
      post :make_team_lead
      delete :remove_user
    end

    # collection do
    #   post :another_action
    # end
  end
  resources :users
end
