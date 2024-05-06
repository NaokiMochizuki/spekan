Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  namespace :account do
    root 'dashboards#index'
    resources :dashboards, only: :index
  end
end
