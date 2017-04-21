Rails.application.routes.draw do
  namespace :gv do
    root "lop_mon_hocs#index"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :lop_mon_hocs, only: [:index, :show, :update]
    resources :cau_hois, expect: :show
    resources :de_this
    resources :de_thi_cau_hois, only: [:index, :create]
    resource :de_thi_cau_hois, only: :destroy
    resources :ngau_nhien_de_this, only: :create
    resources :bai_thi_chi_tiets, only: :show
  end

  namespace :sv do
    root "lop_mon_hocs#index"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :lop_mon_hocs, only: :index
    resources :de_this, only: :index
    resources :bai_this, only: [:create, :show, :update]
    resources :bai_thi_chi_tiets, only: :show
  end
end
