Rails.application.routes.draw do
  namespace :gv do
    root "lop_mon_hocs#index"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :lop_mon_hocs, only: :index
    resources :cau_hois, expect: :show
    resources :de_this
    resources :de_thi_cau_hois, only: [:index, :create]
    resource :de_thi_cau_hois, only: :destroy
  end

  namespace :sv do
    root "lop_mon_hocs#index"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :lop_mon_hocs, only: :index
    resources :de_this, only: :index
    resources :bai_this
  end
end
