class CompareProductsController < ApplicationController
 def create
  @new_compare_product = CompareProduct.new
  @product = Product.find(params[:product_id])
  @new_compare_product.product = @product
  @new_compare_product.user = current_user
  @new_compare_product.save
  redirect_to product_path(@product)
 end


  def index
    # page where you can display all the comparison
    @compare_products = current_user.compare_products.includes(:product).order("products.name ASC")
  end

  def destroy
    @compare_product = CompareProduct.find(params[:id])
    @compare_product.destroy
    redirect_to compare_products_path
  end
end
