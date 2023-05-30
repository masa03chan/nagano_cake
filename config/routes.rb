Rails.application.routes.draw do
  namespace :public do
    root to: "homes#top"
    get "about" => "homes#about", as: "about"
  end
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
    get "/customers/mypage" => "customers#show", as: "customer"
    get "/customers/infomation/edit" => "customers#edit", as: "edit_public_customer"
    patch "/customers" => "customers#update", as: "update_public_customer"
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
    root to: 'homes#top', as: 'admin'
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
