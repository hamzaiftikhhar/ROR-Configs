Rails.application.routes.draw do


    root "products#index"  
    devise_for :users

    concern :subscribable_index_only do
      resources :subscribers, only: [:index]
    end

    resources :passwords, param: :token    #is devise using it? the 

    resources :products do
      resources :subscribers, only: [ :create],shallow: true # nested routes with path parameters. You can create a subscriber for a specific product.  Only allows create action (noshow, etc.).
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
