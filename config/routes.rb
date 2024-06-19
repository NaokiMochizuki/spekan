Rails.application.routes.draw do
  #devise_for :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  namespace :api do
    scope :client do
      post '/sign_in' => 'sessions#create'
      get '/sign_out' => 'sessions#destroy'
      resources :client_users, only: [] do
        collection do
          get 'me'
        end
      end
      resources :users, only: [:index, :show, :update, :destroy] do
        member do
          post 'is_valid'
          get 'selectable_default_payways'
          post 'get_point'
          post 'lost_point'
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
      resources :point_records, only: [:index]
      resource :point_settings, only: [:show, :edit, :update] do
        collection do
          post 'is_valid'
        end
      end
      resources :user_items, only: [] do
        collection do
          get 'default_items'
          get 'original_items'
        end
      end
    end
  end

  namespace :client do
    get '/sign_in' => 'sessions#new'
    root 'dashboards#index'
    resources :users, only: [:index, :show, :edit]
    resources :user_items, only: [:new]
    resources :ranks, only: [:index, :show, :edit]
    resources :rank_records, only: [:index]
    resources :point_records, only: [:index]
    resource :point_settings, only: [:edit, :update]
  end
end
