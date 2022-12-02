Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "projects#index"
  resources :projects
  # Defines the root path route ("/")
  # root "articles#index"
  get 'aboutme' => "aboutme#index", :as => :about_me_path

end
