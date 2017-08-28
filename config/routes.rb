# frozen_string_literal: true
Rails.application.routes.draw do
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :date_masters
  resources :food_logs
  resources :allergic_reaction_logs
  resources :users, only: [:index, :show] do
    resources :date_masters do
      resources :food_logs
      resources :allergic_reaction_logs
    end
  end
  resources :date_masters
  resources :food_logs
  resources :allergic_reaction_logs

  # route to custom controller
  # does its name matter??
  # get '/food_logs/:id/date_masters' => 'food_logs#logs_by_date'
  # how's the data passed from AJAX request

  resources :examples, except: [:new, :edit]

end
