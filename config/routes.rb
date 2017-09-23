Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  get 'commands/historique'
  get 'commands/during'
  get 'commands/import'
  get 'commands/export'
  get 'commands/tuto'
  resources :commands do
    collection { post :import }
  end
  root 'commands#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
