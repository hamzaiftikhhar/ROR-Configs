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

  def feature
  @product = Product.find(params[:id])
  @product.update(featured: !@product.featured)
  flash[:notice] = @product.featured ? "Product marked as featured" : "Product unmarked as featured"
  redirect_to products_path
  end

  def search
  if params[:q].present?
    @products = Product.where("name LIKE ?", "%#{params[:q]}%") #params[:q] is for search query, and the % symbols are wildcards that is use for search functionality. This will return all products whose names contain the search query.
  else
    @products = Product.all
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
