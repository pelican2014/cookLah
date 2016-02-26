Rails.application.routes.draw do
  get 'inventory_management/recipes'
  post 'inventory_management/recipes'
  get 'inventory_management/recipes/:id', to: 'inventory_management#read_recipe', as: 'inventory_management_read_recipe'
  delete 'inventory_management/recipes/:id', to: 'inventory_management#delete_recipe', as: 'inventory_management_delete_recipe'

  get 'inventory_management/ingredients'

  get 'inventory_management/equipment'

  # create ingredient
  post 'inventory_management/create_ingredient', to: 'inventory_management#create_ingredient', as: 'inventory_management_create_ingredient'
  # create equipment
  post 'inventory_management/create_equipment', to: 'inventory_management#create_equipment', as: 'inventory_management_create_equipment'
  
  # create recipe cooking instructions (part two of recipe creation)
  post 'inventory_management/create_recipe_cooking_instructions', to: 'inventory_management#create_recipe_cooking_instructions', as: 'inventory_management_create_recipe_cooking_instructions'

  # recipe configuration (part three of recipe creation)
  post 'inventory_management/create_recipe_configuration', to: 'inventory_management#create_recipe_configuration', as: 'inventory_management_create_recipe_configuration'

  # create recipe (part four of recipe creation)
  post 'inventory_management/create_recipe', to: 'inventory_management#create_recipe', as: 'inventory_management_create_recipe'


  devise_for :users
  devise_for :admins
  get 'homepage/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'homepage#index'

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
