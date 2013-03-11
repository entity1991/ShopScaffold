ShopScaffold::Application.routes.draw do

  root to: 'catalogs#index'

  resources :categories, :except => [:show]
  resources :orders
  resources :carts
  resources :line_items
  resources :sessions,   :only   => [:new, :create, :destroy]
  resources :products,   :except => [:show]
  resources :catalogs
  resources :feedbacks

  match '/catalog',     :to => 'catalogs#index', :as => 'catalog'
  match '/catalog/:id', :to => 'catalogs#show',  :as => 'our_product'

  post '/users/change_role'
  post '/sessions/change_locale', as: 'locale'
  get  '/store/index',            as: 'store'
  get  '/shallow/search',         as: 'search'

  match '/admin_profile', to: 'pages#admin_profile'
  match '/signin',        to: 'sessions#new'
  match '/signout',       to: 'sessions#destroy'

end
