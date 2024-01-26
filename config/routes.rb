Rails.application.routes.draw do
   devise_scope :player do
    root "public/sessions#new"
  end

  devise_for :players,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  devise_scope :player do
    post 'players/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

   namespace :admin do
      resources :posts do
      resources :comments, only:[:index, :show, :destroy]
      end
      resources :players, only:[:index, :show, :edit, :update]
      get 'homes/top'
  end

   namespace :public do
     get 'tag_search' => 'tag_search#tag_search'
  end
  namespace :public do
    get "search" => "searches#search"
    get 'top' => "homes#top"
    get 'about'=>"homes#about",as: "about"

    get 'players/confirm' , to:'players#confirm'
    patch 'players/leave' , to:'players#leave'
    resources :players, only:[:show, :index, :edit, :update] do

    member do
      get :favorites
    end

    resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
    end

   post 'posts/confirm' , to:'posts#confirm'
   get 'posts/completion' , to:'posts#completion'
   get 'posts/posting' , to:'posts#posting'
   resources :posts, only:[:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
   end

   resources :groups, only:[:new, :create, :edit, :update, :show, :index, :destroy] do
   resources :group_approvals, only:[:new, :create, :destroy,:update] do
    delete "reject", on: :member
   end
   resource :group_players, only: [:create, :destroy]
   end
   get "groups/:id/approvals" => "groups#approvals", as: :approvals


  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
