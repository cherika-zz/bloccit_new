Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts
  end

  resources :users, only: [:new, :create]

  resources :questions

  resources :advertisements

  get 'about' => 'welcome#about'

  get 'welcome/contact'

  get 'welcome/faq'

  root to: 'welcome#index'
end
