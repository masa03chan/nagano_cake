Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :order_details, only: [:update]
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, except: [:destroy]
    get "search" => "searches#search"
  end

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about", as: "about"
    get "customers/mypage" => "customers#show", as: "customer"
    get "customers/infomation/edit" => "customers#edit", as: "edit_public_customer"
    patch "customers/infomation" => "customers#update", as: "update_public_customer"
    get "customers/delete_confirm" => "customers#delete_confirm"
    patch "customers/delete" => "customers#delete_process"
    resources :addresses, except: [:new, :show]
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    post "orders/confirmed" => "orders#confirmed"
    resources :orders, only: [:new, :index, :show]
    resources :items, only: [:index, :show]
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items, only: [:index, :update, :create, :destroy]
    get "search" => "searches#search"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
