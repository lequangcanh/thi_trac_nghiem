Rails.application.routes.draw do
  namespace :gv do
    resources :mon_hocs
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
  end
end
