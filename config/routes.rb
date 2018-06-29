Rails.application.routes.draw do


  root "reviews#index"


  resources :reviews
  resources :memberships
  resources :groups do
    resources :posts
  end
  devise_for :teachers
  resources :teachers

end
