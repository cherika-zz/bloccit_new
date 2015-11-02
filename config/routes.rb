Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  resources :users

  resources :questions

  resources :advertisements

  resources :sessions, only: [:new, :create, :destroy]

  get 'about' => 'welcome#about'

  get 'welcome/contact'

  get 'welcome/faq'

  post 'users/confirm' => 'users#confirm'

  root to: 'welcome#index'
end
