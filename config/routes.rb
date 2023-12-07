Rails.application.routes.draw do

   devise_for :players,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}



  namespace :public do


    root to: "homes#top"
    get 'about'=>"homes#about",as: "about"

    resources :calendars, only:[:new, :create, :edit, :update, :destroy]

    resources :group_approvals, only:[:new, :create]

    get 'players/confirm' , to:'players#confirm'
    patch 'players/leave' , to:'players#leave'
    get 'players/my_page', to: 'players#show'
    get 'players/information/edit', to:'players#edit'
    patch 'players/information' , to:'players#update'

   post 'posts/confirm' , to:'posts#confirm'
   get 'posts/completion' , to:'posts#completion'
   get 'posts/information/edit', to:'posts#edit'
   patch 'posts/information' , to:'posts#update'
   resources :posts, only:[:new, :create, :index, :show, :destroy]

    resources :groups, only:[:new, :create, :edit, :update, :show, :index, :destroy]

    resources :comments, only:[:create, :destroy]

    resources :favorites, only:[:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
