Rails.application.routes.draw do
  root 'application#index'
  
  resources :users, path_names: { new: 'sign_up', edit: 'account' }
  resources :sessions, path_names: { create: 'sign_in', destroy: 'sign_out' }, only: [:create, :destroy]
end
