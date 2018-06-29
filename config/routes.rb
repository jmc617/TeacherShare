Rails.application.routes.draw do


  get 'post_comments/show'
  get 'post_comments/edit'
  get 'review_comments/show'
  get 'review_comments/edit'
  root "reviews#index"


  resources :reviews
  resources :memberships
  resources :groups do
    resources :posts
  end
  devise_for :teachers, controllers: { registrations: 'teachers/registrations' }
  resources :teachers

end
