Rails.application.routes.draw do
  namespace :account do
    root 'dashboards#index'
  end
end
