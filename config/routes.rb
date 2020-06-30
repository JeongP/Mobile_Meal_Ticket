Rails.application.routes.draw do

  resources :ts
  resources :notes
  get 'comments/create'
  get 'comments/destroy'

  get 'user_lecture_jjims/create'
  get 'user_lecture_jjims/destroy'
  get 'user_lecture_listens/create'
  get 'user_lecture_listens/destroy'
  get 'user_lecture_listens/index'
  get 'user_items/create'
  get 'user_items/destroy'
  root 'lectures#index'
  get 'home/index'
  get 'home/mypage'
  get 'tutors/new'
  post 'tutors/create'
  post 'lectures/:id/like' => 'likes#like_toggle'
  # 강의 route

  # 졸프_모바일 식권
  get 'home/ticket'
  get 'home/menu'
  get 'home/buy'
  get 'home/my'

  # 졸프_모바일 식권

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :intros
  resources :settings
  resources :messages
  resources :faqs
  resources :posts
  resources :pages
  resources :users
  resources :items
  resources :lectures
  resources :user_items, only:[:create, :destroy, :index]
  resources :user_lecture_listens, only:[:create, :destroy, :index]
  resources :user_lecture_jjims, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :buying, only: [:create]
  resources :home


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
