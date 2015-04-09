Rails.application.routes.draw do
  root 'application#index'

  post :sign_in, to: 'sessions#create', as: :sign_in
  get :sign_out, to: 'sessions#destroy', as: :sign_out

  resource :user, path_names: { new: 'sign_up', edit: 'account' }, except: :destroy do
    get :refill, to: 'user#refill'
  end

  resources :bets, only: :create
  delete :bets, to: 'bets#destroy'
  get :play, to: 'bets#index'
  get :locked, to: 'bets#locked'
end
