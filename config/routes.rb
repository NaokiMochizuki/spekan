Rails.application.routes.draw do
  devise_for :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  namespace :client do
    root 'dashboards#index'
    resources :users, only: [:index]
  end
end
