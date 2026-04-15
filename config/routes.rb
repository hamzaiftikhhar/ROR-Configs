# Rails.application.routes.draw do



#   # ...
#   get "/products", to: "products#index"

#   get "/products/new", to: "products#new"
#   post "/products", to: "products#create"

#   get "/products/:id", to: "products#show"

#   get "/products/:id/edit", to: "products#edit"
#   patch "/products/:id", to: "products#update"
#   put "/products/:id", to: "products#update"

#   delete "/products/:id", to: "products#destroy"
# end

Rails.application.routes.draw do

    concern :subscribable_index_only do
      resources :subscribers, only: [:index]
    end

  # resources :products              # This simplifies the routing for all CRUD actions for products
    root "products#index"  
    resource :session
         #This will allow me to lists all products, and this sets the root URL ("/") to point to the index action of the ProductsController.
    resources :passwords, param: :token     # This creates routes for password management, using a token as the parameter for identifying the password reset request.

    resources :products do
      resources :subscribers, only: [ :create] # nested routes with path parameters. You can create a subscriber for a specific product.  Only allows create action (noshow, etc.).
      #This creates nested routes like: POST /products/:product_id/subscribers  
      # Example: /products/20/subscribers
    

      #Add More RESTful Routes
      member do
        patch "feature" # This adds a custom member route for the "feature" action, which will be accessible via PATCH /products/:id/feature. This allows you to mark a specific product as featured. 
      end 
      
      collection do
        get "search"
      end
    end
    resource :unsubscribe, only: [ :show ]
    
    namespace :admin do
      resources :products, concerns: :subscribable_index_only
    end

    #scope :admin, module: :admin do   
    #   resources :products, concerns: :subscribable_index_only
    # end
end 