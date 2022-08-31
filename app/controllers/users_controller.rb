class UsersController < ApplicationController
  def favorites
    @favorites = current_user.favorited_by_type('Product')
  end

end

# @compare_product = CompareProduct.find(params[:id])
# @compare_product.destroy
# redirect_to compare_products_pathv
