Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
  mount Spree::Core::Engine, :at => '/'
          # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  get   "product/:id/edit" => 'product#edit'
  post  "product/update" => 'product#update'
  
  Spree::Core::Engine.routes.prepend do
    match 'wizard/:product_id/:state/', :to => 'products#customize', as: 'wizard', via: :get
    match 'inspired/:id', :to => 'products#show_inspired', as: 'inspired', via: :get
    post  'home/apply_coupon_bar' => 'home#apply_coupon_bar' 
    post  'products/edit_inspired' => 'products#edit_inspired' 
    post  'product/update_cart' => 'products#update_cart'

    resources :workshops, only: [:index, :show]
    resources :ambassadors, only: [:index, :show]

    namespace :admin do
      resources :categories
      resources :home
      resources :ambassadors
      resources :warranties
    end

    match 'warranties/search', to: 'warranties#search', via: [:get, :post]
    
    resources :orders do
      resources :warranties, only: [:new, :create, :labels], shallow: true do
        member do
          get 'labels'
        end
      end
    end

  end

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
