Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
  },skip: [:registrations]

  devise_scope :customer do
    get "/customers/sign_up" => "customers/registrations#new"
    post "/customers" => "customers/registrations#create"
  end

  root to: 'public/homes#top'
  get "/about" => "public/homes#about"

  resource :customers, only: [:show, :edit, :update]
  get "/customers/confirm" => "customers#confirm"
  patch "/customers/withdraw" => "customers#withdraw", as: 'withdraw_customer'

  resources :cart_items, only: [:index, :update, :destroy, :create]
  delete "/cart_items" => "cart_items#empty", as: 'empty_cart'

  resources :address, only: [:index, :edit, :create, :update, :destroy]

  get "/orders/thanks" => "orders#thanks", as: 'thanks'
  post "/orders/confirm" => "orders#confirm", as: 'confirm'
  resources :orders, only: [:new, :create, :index, :show]

  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end


  resources :items, only: [:index, :show], module: :public

end
