Rails.application.routes.draw do
  get 'sponsored_post/show'

  get 'sponsored_post/new'

  get 'sponsored_post/edit'

  resources :labels, only: [:show]
  resources :questions
  resources :advertisements
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]
  post "users/confirm" => "users#confirm"


  resources :sessions, only: [:new, :create, :destroy]
  get 'welcome/about' => 'welcome#about'
  get 'faq' => 'welcome#about'
  root 'welcome#index'
end
