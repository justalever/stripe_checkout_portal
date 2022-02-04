require 'sidekiq/web'

Rails.application.routes.draw do
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  devise_for :users
  root to: 'home#index'

  scope controller: :static do
    get :pricing
  end

  namespace :purchase do
    resources :checkouts
  end

  get "success", to: "purchase/checkouts#success"

  resources :subscriptions
end
