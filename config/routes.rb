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
  resources :products # This simplifies the routing for all CRUD actions for products
    resource :session
  resources :passwords, param: :token
end 