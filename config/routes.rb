Sample2::Application.routes.draw do
  root to: "users#index"
  resource :sessions
  resources :users do
    resources :addresses
  end
end
