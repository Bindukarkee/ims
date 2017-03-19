Rails.application.routes.draw do

  root to:'homes#home'
 # devise_for :homes
  #, :skip => [:registrations]
  #as :user do
 #   get 'homes/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
  #  put 'homes' => 'devise/registrations#update', :as => 'user_registration'
  #end


  #root to:'homes#index'
  #resources :homes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/users/sign_up", to: redirect('/404')

  devise_scope :user do
    get 'new', to: 'devise/registrations#new'
  end

  devise_for :users

  resources :homes

  resources :units

  resources :items

  resources :item_groups


  resources :fiscal_years


  resources :stocks


  resources :sales

  resources :logs

  resources :suppliers

  resources :company_profiles

  resources :customers


end
