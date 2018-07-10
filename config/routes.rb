Rails.application.routes.draw do

  root "reviews#index"

  resources :save_posts

  delete "/reviews/:review_id/delete_picture_attachment/:index", to: 'reviews#delete_picture_attachment'

  delete "/posts/:post_id/delete_image_attachment/:index", to: 'posts#delete_image_attachment'

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  resources :reviews do
    resources :review_comments
  end

  resources :memberships

  resources :groups do
    resources :posts do
      resources :post_comments
    end
  end

  devise_for :teachers, controllers: { registrations: 'teachers/registrations' }

  resources :teachers

  delete "/teachers/:id/delete_avatar", to: "teachers#delete_avatar"


end
