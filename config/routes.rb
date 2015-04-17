Rails.application.routes.draw do
  root 'application#index'

  post :sign_in, to: 'sessions#create', as: :sign_in
  get :sign_out, to: 'sessions#destroy', as: :sign_out

  resource :user, path_names: { new: 'sign_up', edit: 'account' }, except: :destroy do
    get :refill, action: :refill
  end

  resource :bets, only: [:create, :destroy] do
    get :history
  end
  get :play, to: 'bets#index'

  get 'lang/:lang', to: 'users#lang'
end
