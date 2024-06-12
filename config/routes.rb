Rails.application.routes.draw do
  #devise_for :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  namespace :api do
    scope :client do
      post '/sign_in' => 'sessions#create'
      get '/sign_out' => 'sessions#destroy'
      resources :users, only: [:index, :show, :update, :destroy] do
        member do
          post 'is_valid'
          get 'selectable_default_payways'
          post 'give_point'
          post 'use_point'
        end
        collection do
          get 'me'
        end
        resources :user_ranks, only: [:update]
      end
      resources :ranks, only: [:index, :show, :update, :destroy] do
        member do
          post 'is_valid'
          get 'selectable_automation_types'
        end
        resources :rank_automations, only: [:create, :update] do
          collection do
            post 'is_valid'
          end
        end
      end
      resources :rank_records, only: [:index]
    end
  end

  namespace :client do
    get '/sign_in' => 'sessions#new'
    root 'dashboards#index'
    resources :users, only: [:index, :show, :edit]
    resources :ranks, only: [:index, :show, :edit]
    resources :rank_records, only: [:index]
  end
end
