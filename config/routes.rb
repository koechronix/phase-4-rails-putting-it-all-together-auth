Rails.application.routes.draw do
  #  user route
  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  delete "/logout", to: "sessions#destroy"
  post "/login", to: "sessions#create"

  #recipes route
 get "/recipes", to: "recipes#index"
 post "/recipes", to: "recipes#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
