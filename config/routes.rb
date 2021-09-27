Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  root to: 'customers/homes#top'
  get "/about" => "customers/homes#about"

  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]

  end
end
