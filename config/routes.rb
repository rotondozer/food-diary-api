# frozen_string_literal: true
Rails.application.routes.draw do
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'

  # creating resources that belong to both 'user' and 'date_master' (are owned by the date)
  post '/users/:user_id/food_logs/:date' => 'food_logs#create'
  post '/users/:user_id/allergic_reaction_logs/:date' => 'allergic_reaction_logs#create'

  # 'indexing', but scoped to the user and date
  get '/users/:user_id/food_logs/:date' => 'food_logs#index'
  get '/users/:user_id/allergic_reaction_logs/:date' => 'allergic_reaction_logs#index'

  resources :users, only: [:index, :show]
  resources :users, shallow: true do
    resources :date_masters
    resources :food_logs
    resources :allergic_reaction_logs
  end

end
