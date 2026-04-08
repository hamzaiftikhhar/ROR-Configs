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
  # resources :products # This simplifies the routing for all CRUD actions for products

    resource :session
    root "products#index"           #This will allow me to lists all products, and this sets the root URL ("/") to point to the index action of the ProductsController.
    resources :passwords, param: :token     #

    resources :products do
      resources :subscribers, only: [ :create ]    
    #This creates nested routes like: POST /products/:product_id/subscribers  
    # Example: /products/20/subscribers

    end

    resource :unsubscribe, only: [ :show ]
end 