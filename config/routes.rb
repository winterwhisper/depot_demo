Depot::Application.routes.draw do
  constraints :subdomain => "console" do
    match '/' => 'console/home#index', as: :console
    get "home/index"
    resources :products, :module => "console", as: :console_products
    resources :orders, :module => "console", as: :console_orders
    resources :users, :module => "console", as: :console_users

    controller :session, :module => "console" do
      get 'login' => :new, as: :console_login
      post 'login' => :create, as: :console_login
      delete 'logout' => :destroy, as: :console_logout
    end
  end

  resources :password_resets, :only => [ :new, :create, :edit, :update ]
  resources :users, :orders, :line_items, :carts
  resources :products do
    member do
      get 'who_bought'
    end
  end

  controller :users do
    get 'signup' => :new
  end
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get "store/index"
  get "admin/index"
  # match '/' => 'console/home#index', :constraints => { :subdomain => 'console' }
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'store#index', :as => 'store'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
