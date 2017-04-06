Rails.application.routes.draw do
  namespace :gv do
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :lop_mon_hocs, only: :index
    resources :cau_hois
  end
end
