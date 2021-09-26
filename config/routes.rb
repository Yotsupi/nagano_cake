Rails.application.routes.draw do
  devise_for :admin
  devise_for :customers

  root to: 'public/homes#top'
  get "/about" => "public/homes#about"
  namespace :public do

  end
end
