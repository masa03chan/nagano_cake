Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about", as: "about"
    get "/customers/mypage" => "customers#show", as: "customer"
    get "/customers/infomation/edit" => "customers#edit", as: "edit_public_customer"
    patch "/customers" => "customers#update", as: "update_public_customer"
    get "/customers/delete_confirm" => "customers#delete_confirm"
    patch "/customers/delete" => "customers#delete_process"
    resources :addresses, except: [:new, :show]
    resources :orders, only: [:new, :index, :show]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :create, :destroy]
  end
  
  namespace :admin do
    root to: 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :order_details, only: [:update]
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, except: [:destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
