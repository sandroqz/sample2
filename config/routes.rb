Sample2::Application.routes.draw do
  constraints(lambda { |req| req.env["HTTP_USER_AGENT"] =~ /iPhone/ }) do
    root to: "users#index"
  end
  root to: "users#index"
  resource :sessions, only: [:new, :create, :destroy]
  resources :users, except: [:show] do
    member do
      put 'activate'
    end
    collection do
      get 'active_users'
    end
    resources :addresses, path_names: {new: "new_form", edit: "edit_form"}
  end
end
