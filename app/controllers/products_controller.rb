class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.all
    if params[:query].present?
      @products = Product.search_by_name_and_ticker(params[:query])
    end

   # @search = params[:search]
    if params[:search].present?
     # @sectors = @search[:sector].reject(&:blank?)
     # @products = []
     # @sectors.each do |sector|
       @products = Product.where(sector: params[:search][:sector].reject(&:blank?))
      #end
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

  private

  def skip_pundit?
    devise_controller? || params[:controller]
  end
end
