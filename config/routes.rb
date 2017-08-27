# frozen_string_literal: true
Rails.application.routes.draw do
  resources :date_masters, only: [:index]
  resources :allergic_reaction_logs
  resources :food_logs
  # route to custom controller
  get '/food_logs/:id/date_masters' => 'food_logs#logs_by_date'
  # how's the data passed from AJAX request

  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
end
