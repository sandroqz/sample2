Sample2::Application.routes.draw do
  root to: "users#index"
  resource :sessions, only: [:new, :create, :destroy]
  scope shallow_path: "usr" do
    resources :users, except: [:show] do
      resources :addresses, shallow: true, path_names: {new: "new_form", edit: "edit_form"}
    end
  end
end
