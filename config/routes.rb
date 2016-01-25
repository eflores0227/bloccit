Rails.application.routes.draw do
  resources :posts
  get 'welcome/about' => 'welcome#about'
  get 'posts' => 'posts'
  root 'welcome#index'
end
