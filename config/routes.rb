Rails.application.routes.draw do
  root 'application#index'
  
  post :sign_in, to: 'sessions#create', as: :sign_in
  get :sign_out, to: 'sessions#destroy', as: :sign_out
  
  resources :users, path_names: { new: 'sign_up', edit: 'account' }, except: :destroy
  
  resources :bets, only: [:create]
  get :play, to: 'bets#index'
  delete :bets, to: 'bets#destroy'
end
