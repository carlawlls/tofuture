class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.all
    if params[:query].present?
      @products = @products.search_by_name_and_ticker(params[:query])
    end

   # @search = params[:search]
    if params[:sectors]&.any?
     # @sectors = @search[:sector].reject(&:blank?)
     # @products = []
     # @sectors.each do |sector|
       @products = @products.where(sector: params[:sectors])
      #end
     end
    if params[:product_types]&.any?
      @products = @products.where(product_type: params[:product_types])
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def toggle_favorite
    @product = Product.find(params[:id])
    if current_user.favorited?(@product)
      current_user.unfavorite(@product)
    else
      current_user.favorite(@product)
    end
    redirect_to product_path(@product)
  end

  def skip_pundit?
    devise_controller? || params[:controller]
  end
end
