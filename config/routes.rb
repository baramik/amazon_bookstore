Models::Application.routes.draw do
  get "categories/new"
  get "categories/create"
  get "categories/update"
  get "categories/delete"
  get "countries/new"
  get "countries/create"
  get "countries/update"
  get "countries/delete"
  get "order_items/new"
  get "order_items/create"
  get "order_items/update"
  get "order_items/delete"
  get "orders/new"
  get "orders/create"
  get "orders/update"
  get "orders/delete"
  get "addresses/create"
  get "addresses/update"
  get "customers/new"
  get "customers/create"
  get "customers/update"
  get "customers/delete"
  get "raitings/new"
  get "raitings/create"
  get "raitings/update"
  get "raitings/delete"
  get "credit_cards/new"
  get "credit_cards/create"
  get "credit_cards/update"
  get "credit_cards/delete"
  get "books/new"
  get "books/create"
  get "books/update"
  get "books/delete"
  get "authors/new"
  get "authors/create"
  get "authors/update"
  get "authors/delete"
  get "addresses/new"
  get "addresses/createupdate"
  get "addresses/delete"
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
