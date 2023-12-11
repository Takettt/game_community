Rails.application.routes.draw do

   devise_for :players,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}



  namespace :public do
    root to: "public/sessions#new"
    get 'top' => "homes#top"
    get 'about'=>"homes#about",as: "about"

    post 'calendars/confirm' , to:'calendars#confirm'
    get 'calendars/completion' , to:'calendars#completion'
    resources :calendars, only:[:new, :create, :edit, :update, :destroy]

    resources :group_approvals, only:[:new, :create]

    get 'players/confirm' , to:'players#confirm'
    patch 'players/leave' , to:'players#leave'
    resources :players, only:[:show, :index, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      	get "followings" => "relationships#followings", as: "followings"
  	    get "followers" => "relationships#followers", as: "followers"
      end

   post 'posts/confirm' , to:'posts#confirm'
   get 'posts/completion' , to:'posts#completion'
   resources :posts, only:[:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
   end

   resources :groups, only:[:new, :create, :edit, :update, :show, :index, :destroy]


  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
