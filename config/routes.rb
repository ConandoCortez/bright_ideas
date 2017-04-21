Rails.application.routes.draw do
    get "/" => "sessions#index"
    get "/logout" => "sessions#logout"

    # Routes for checking login and registration
    post "/sessions/register" => "sessions#register"
    post "/sessions/login" => "sessions#login"

    # Route for user controller: showing all bright ideas and user profiles
    get "/bright_ideas" => "users#bright_ideas"
    get "/users/:id" => "users#show"

    # Route for ideas controller
    post "/ideas/add" => "ideas#add"
    get "/ideas/:idea_id/destroy" => "ideas#destroy"
    get "/bright_ideas/:idea_id" => "ideas#idea"

    # Routes for like controller. Liking and unliking an idea
    get "/users/:id/ideas/:idea_id/like" => "likes#like"
    get "/users/:id/ideas/:idea_id/unlike" => "likes#unlike"
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
