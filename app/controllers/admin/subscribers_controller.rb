class Admin::SubscribersController < ApplicationController
  before_action :set_product

  def index
    @subscribers = @product.subscribers
  end
  def create
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end