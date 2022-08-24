class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.all
    if params[:query].present?
      @products = Product.search_by_name_and_ticker(params[:query])
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
