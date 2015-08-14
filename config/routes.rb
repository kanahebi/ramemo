Rails.application.routes.draw do

  root 'portal#index'
  get 'portal/index'

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  resources :shops do
    collection do
      get 'modal'
      post 'modal_create'
    end
  end

  resources :refills

  resources :toppings

  resources :tastes do
    collection do
      get 'modal'
      post 'modal_create'
    end
  end

  resources :ramen, shallow:true do
    resources :comments
    resources :likes
    collection do
      get ':taste_id/tastes' => 'ramen#tastes', as: :tastes
      get ':shop_id/shops' => 'ramen#shops', as: :shops
      get ':chain_shop_id/chain_shops' => 'ramen#chain_shops', as: :chain_shops
    end
  end

#  get ':user_code' => 'ramen#users', as: :users

  get ':user_code' => 'users#ramen', as: :users_ramen
  get ':user_code/following' => 'users#following', as: :users_following
  get ':user_code/followers' => 'users#followers', as: :users_followers
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
