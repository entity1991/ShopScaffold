ShopScaffold::Application.routes.draw do

  root to: 'catalogs#index'

  resources :categories, :except => [:show]
  resources :orders
  resources :carts
  resources :line_items
  resources :sessions,   :only   => [:new, :create, :destroy]
  resources :products,   :except => [:show]
  resources :catalogs
  match "/catalog",     :to => "catalogs#index", :as => "catalog"
  match "/product/:id", :to => "catalogs#show",  :as => "product"

  post "/users/change_role"
  post "/sessions/change_locale", as: "locale"
  get  "/store/index",            as: "store"
  get  "/shallow/search",         as: "search"

  match '/admin_profile', to: 'pages#admin_profile'
  match '/contact',       to: 'pages#contact'
  match '/about',         to: 'pages#about'
  match '/help',          to: 'pages#help'
  match '/signin',        to: 'sessions#new'
  match '/signout',       to: 'sessions#destroy'

end
