Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles

  get "/" => "pages#home"
  get "/about" => "pages#about"

  get "test/api" => "articles#testApi"
end
