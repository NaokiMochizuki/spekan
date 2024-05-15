Rails.application.routes.draw do
  #devise_for :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  namespace :api do
    scope :client do
      resources :users, only: [:index]
      resources :ranks, only: [:index]
    end
  end

  namespace :client do
    get '/sign_in' => 'sessions#new'
    post '/sign_in' => 'sessions#create'
    get '/sign_out' => 'sessions#destroy'
    root 'dashboards#index'
    resources :users, only: [:index, :show, :edit]
    resources :ranks, only: [:index]
  end
end
