class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.all
    if params[:query].present?
      @products = @products.where("name ILIKE ?", "%#{params[:query]}%")
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
