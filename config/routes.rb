Rails.application.routes.draw do

  root "reviews#index"

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

end
