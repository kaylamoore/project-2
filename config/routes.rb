Rails.application.routes.draw do

  #root to: "users#index"

  root "sessions#new"
  get "users" => "users#index"
  get "users/new" => "users#new"
  post "users" => "users#create"
  get "users/:id" => "users#show", as: :user

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  delete '/logout' => "sessions#destroy"

  get "users/:id/notes" => "notes#index"
  get "users/:id/notes/new" => "notes#new", as: :new_user_note
  post "users/:id/notes/new" => "notes#create"
  delete "users/:id/notes/new" => "notes#destroy", as: :delete_note
  #patch "notes/:id" => "notes#update", as: :update_note
  #put "notes/:id" => "notes#update"

  get "users/:id/pictures" => "pictures#index"
  get "users/:id/pictures/new" => "pictures#new", as: :new_user_picture
  post "users/:id/pictures/new" => "pictures#create"
  delete "users/:id/pictures/new" => "pictures#destroy", as: :delete_picture

  #get 'login' => 'sessions#new'

  
  #resources :users, only: [:index, :show, :new, :create]
  #resources :sessions, only: [:index, :new, :create, :destroy]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
