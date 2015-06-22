Rails.application.routes.draw do
  
  get 'carts/checkout'
  get 'orders/index'

  get 'orders/show'

  get 'orders/new'

  get 'orders/edit'

  get 'orders/create'

  get 'orders/update'

  get 'orders/destroy'
  
  get 'orders/save_order'

  post 'orders/save_order'
  
  get 'orders/order_list'
  get 'carts/index'

  get 'carts/show'

  get 'carts/new'

  get 'carts/edit'

  get 'carts/create'

  get 'carts/update'

  get 'carts/destroy'

  get 'lineitems/index'

  get 'lineitems/show'

  get 'lineitems/new'

  get 'lineitems/edit'

  get 'lineitems/create'
  
  post 'lineitems/decrement'
  
  delete 'lineitems/delete'

  get 'lineitems/update'

  get 'lineitems/destroy'
get 'home/index'
  #resources :reviews

 resources :lineitems
  get 'books/search'
  get 'books/category'
  get 'books/show_by_category'
  resources :books do
    resources :reviews
  end

  devise_for :admins
  devise_for :users
  resources :users, only: [:index, :show, :destroy, :edit, :update]
  
  root 'books#index'
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
