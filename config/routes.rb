# frozen_string_literal: true
Rails.application.routes.draw do
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  # get '/date_masters/:id' => 'date_masters#index'
  # get '/food_logs/:id' => 'food_logs#index'
  # get 'allergic_reaction_logs/:id' => 'allergic_reaction_logs#index'

  resources :users, only: [:index, :show] do
    resources :date_masters do
      resources :food_logs
    end
  end

  resources :users, only: [:index, :show] do
    resources :date_masters do
      resources :allergic_reaction_logs
    end
  end

  resources :date_masters
  resources :food_logs
  resources :allergic_reaction_logs

  resources :examples, except: [:new, :edit]

end
