Rails.application.routes.draw do
  resources :categoria
  resources :ahorros
  get 'dashboard/dashboard'
  resources :model_visita
  resources :lugars
  devise_for :models, controllers: {
    registrations: 'models/registrations'
  }
  resources :widgets
  resources :models do 
    member do 
      get :confirm_email
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
