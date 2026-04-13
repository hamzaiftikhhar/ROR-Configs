class Admin::SubscribersController < ApplicationController
  before_action :set_product

  def index
    @subscribers = @product.subscribers
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end