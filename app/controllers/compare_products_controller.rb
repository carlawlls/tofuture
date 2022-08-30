class CompareProductsController < ApplicationController
 def create
 @new_product = Product.new(compare_products_params)
 end

 def show
  product = Product.find(params[:id])
  render json: product
 end


 def index
  # page where you can display all the comparison
  @compare_products = Product.all
  # check if the params are p1 p2 p3
  @compare_product = Product.find(params[:p1])
  # make an array and put products
  # products_array = []
  # products_array << Product.find(params[:id])
 end

def destroy
  @compare_product = Product.find(params[:product_id])
  @compare_product.destroy
end

private

def compare_products_params
  params.require(:compare_products).permit(:user_id, :product_id)
end

end
