Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks],controllers: {
        registrations: 'api/v1/auth/registrations'
      }

      namespace :auth do
        resources :sessions, only: [:index]
      end
    end
  end

  resources :purposes, only: [:index, :create, :update, :destroy]
  resources :tasks, only: [:index, :create, :update, :destroy]
  resources :payments, only: [:index, :create, :update, :destroy]
  resources :incomes, only: [:index, :create, :update, :destroy]
  resources :accounts, only: [:index, :create, :update, :destroy]
  resources :transfers, only: [:index, :create, :update, :destroy]
  resources :categories, only: [:index, :create, :update, :destroy]
  resources :classifications, only: [:index, :create, :update, :destroy]
  resources :classificationMonthlyAmounts, only: [:index, :create, :update, :destroy]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
