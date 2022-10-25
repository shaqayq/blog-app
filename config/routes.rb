Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"

  get "user/:user_id/posts", to: "posts#index"
  get "user/:user_is/posts/:id", to: "posts#show"
end
