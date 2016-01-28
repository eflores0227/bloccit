Rails.application.routes.draw do
  resources :questions
  resources :advertisements

  resources :posts
  get 'welcome/about' => 'welcome#about'
  get 'posts' => 'posts'
  root 'welcome#index'
end
