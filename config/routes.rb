Rails.application.routes.draw do
  get 'homepage/recipes'
  get 'homepage', to: 'homepage#recipes'
  post 'homepage/recipes'
  get 'homepage/recipes/:id', to: 'homepage#read_recipe', as: 'homepage_read_recipe'
  delete 'homepage/recipes/:id', to: 'homepage#delete_recipe', as: 'homepage_delete_recipe'

  get 'homepage/ingredients'
  delete 'homepage/ingredients/:id', to: 'homepage#delete_ingredient', as: 'homepage_delete_ingredient'

  get 'homepage/equipment'
  delete 'homepage/equipment/:id', to: 'homepage#delete_equipment', as: 'homepage_delete_equipment'


  # create ingredient
  post 'homepage/create_ingredient', to: 'homepage#create_ingredient', as: 'homepage_create_ingredient'
  # create equipment
  post 'homepage/create_equipment', to: 'homepage#create_equipment', as: 'homepage_create_equipment'
  
  # create recipe cooking instructions (part two of recipe creation)
  post 'homepage/create_recipe_cooking_instructions', to: 'homepage#create_recipe_cooking_instructions', as: 'homepage_create_recipe_cooking_instructions'

  # recipe configuration (part three of recipe creation)
  post 'homepage/create_recipe_configuration', to: 'homepage#create_recipe_configuration', as: 'homepage_create_recipe_configuration'

  # create recipe (part four of recipe creation)
  post 'homepage/create_recipe', to: 'homepage#create_recipe', as: 'homepage_create_recipe'

  # output inventory information in json
  get 'homepage/secret_rendezvous'


  devise_for :users
  devise_for :admins

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'homepage#recipes'

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
