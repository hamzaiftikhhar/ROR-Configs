class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  #Before Rails runs the show, edit, update, or destroy action, it calls the set_product method automatically.
 #Why: These actions need a specific product (@product) to work on. Instead of writing @product = Product.find(params[:id]) in every action, we do it once in a method and call it before the action runs.
 
 
 allow_unauthenticated_access only: %i[ index show ]
  def index
    @products = Product.all
  end

  def show
  end

  def new                  # It doesn't save anything to the database. It just creates a new instance of the model so Rails form helpers can generate input fields.
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product created successfully"
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Product updated successfully"
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end



  def destroy
    @product.destroy
    redirect_to products_path
  end


  private      
    def set_product
      @product = Product.find(params[:id])  #how this is working?  When a user visits a URL like /products/1, the :id parameter is set to "1". The set_product method uses this parameter to find the corresponding product in the database and assigns it to the @product instance variable. This allows the show, edit, update, and destroy actions to access the specific product that the user is interacting with.
    end

    def product_params
      params.expect(product: [ :name, :description , :featured_image , :inventory_count])
    end
end
