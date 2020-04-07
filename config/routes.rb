Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#index"
  scope "/blog_posts/:id" do
    resources :comments
  end
  resources :blog_posts

  resources :github, only: [:index]
  resources :twitter, only: [:index]
  resources :comments, only: [:index, :create, :new]
end
