Rails.application.routes.draw do
  resources :advertisements

  resources :posts
  get 'welcome/about' => 'welcome#about'
  get 'posts' => 'posts'
  root 'welcome#index'
end
