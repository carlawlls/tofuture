class UsersController < ApplicationController
  def favorites
    @favorites = current_user.favorited_by_type('Product')
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def board
    @user = User.find(params[:id])
    @products = @user.all_favorited
  end
end

# @compare_product = CompareProduct.find(params[:id])
# @compare_product.destroy
# redirect_to compare_products_pathv
