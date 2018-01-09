Rails.application.routes.draw do
  root 'posts#index'
  get 'index' => 'welcome#index'
  get 'posts/new' => 'posts#new'
  post 'posts' => 'posts#create'
  get 'posts/:id' => 'posts#show', as: 'post'
  get 'posts/:id/edit' => 'posts#edit', as: 'post_edit'
  patch 'posts/:id' => 'posts#update'
  delete 'posts/:id' => 'posts#destroy'
  delete 'comments/:id' => 'comments#destroy', as: 'comments'
  resources :posts do
    resources :comments
  end
end
