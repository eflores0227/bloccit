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
    resources :favorites, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down_vote' => 'votes#down_vote', as: :down_vote
  end

  resources :users, only: [:new, :create, :show]
  post "users/confirm" => "users#confirm"


  resources :sessions, only: [:new, :create, :destroy]
  get 'welcome/about' => 'welcome#about'
  get 'faq' => 'welcome#about'
  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update]
      resources :topics, except: [:edit, :new]
      resources :posts, only: [:index, :show]
      resouces :comments, only: [:index, :show]
    end
  end
end
