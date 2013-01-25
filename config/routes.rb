ShopScaffold::Application.routes.draw do

  root :to => 'pages#home'

  resources :categories
  resources :orders
  resources :carts
  resources :sessions, :only => [:new, :create, :destroy]
  resources :articles

  post "/users/change_role"
  post "/sessions/change_locale", as: "locale"
  get  "/store/index",            as: "store"
  get  "/shallow/search",         as: "search"

  match '/contact',       :to => 'pages#contact'
  match '/about',         :to => 'pages#about'
  match '/help',          :to => 'pages#help'
  match '/signin',        :to => 'sessions#new'
  match '/signout',       :to => 'sessions#destroy'

end
