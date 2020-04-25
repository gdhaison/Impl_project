Rails.application.routes.draw do
  root 'sessions#new'
  post "/login", to: "sessions#create"
  get "/search", to: "search#index"
  delete "/logout", to: "sessions#destroy"
  resource :repos, only: :show
end
