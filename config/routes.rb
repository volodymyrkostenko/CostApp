Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories
  resources :projects do
    resources :items
  end
  root to: 'projects#index'
  devise_for :users, controllers: { registrations: "registrations"}
end
