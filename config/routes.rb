Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts, only: [:new]
end
