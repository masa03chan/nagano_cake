Rails.application.routes.draw do
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  namespace :admin do
    resources :order_details, only: [:update]
  end
  namespace :admin do
    resources :orders, only: [:show, :update]
  end
  namespace :public do
    resources :customers, only: [:show, :edit, :update]
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :items, except: [:destroy]
  end
  namespace :public do
    resources :addresses, except: [:new, :show]
  end
  namespace :public do
    resources :orders, only: [:new, :index, :show]
  end
  namespace :public do
    resources :cart_items, only: [:index, :update, :create, :destroy]
  end
  namespace :public do
    resources :items, only: [:index, :show]
  end
  namespace :admin do
    get 'homes/top' => 'admin/homes#top', as: "admin"
  end
  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
