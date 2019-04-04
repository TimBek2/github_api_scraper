Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :jobs, only: [:show] do
    collection do
      get 'delete_all', to: 'jobs#delete_all', as: :clear
      get 'show_all', to: 'jobs#show_all', as: :show_all
    end
  end

  post 'jobs/search', to: 'jobs#search', as: :search_jobs

  root to: 'home#index'
end
