class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @products = Product.all
    if params[:query].present?
      @products = @products.search_by_name_and_ticker(params[:query])
    end

    if params[:sectors]&.any?
       @products = @products.where(sector: params[:sectors])
     end
    if params[:product_types]&.any?
      @products = @products.where(product_type: params[:product_types])
    end
  end

  def show
    @product = Product.find(params[:id])
    @compare_product = CompareProduct.new
    # if params[:query]
    #   @comparsion_product = Product.find(params[:query])
    # end
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


  def delete_favorites
    @favorite = Product.find(params[:product_id])
    current_user.unfavorite(@favorite)
    redirect_to favorites_path
  end



  def skip_pundit?
    devise_controller? || params[:controller]
  end
end
