Rails.application.routes.draw do

  devise_for :users

  resources :wikis
  resources :charges, only: [:new, :create]

  post 'downgrade_account' => 'users#downgrade_account'
  get 'about' => 'welcome#about'
  root 'welcome#index'

end
