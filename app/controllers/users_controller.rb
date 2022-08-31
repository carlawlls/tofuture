class UsersController < ApplicationController
  def favorites
    @favorites = current_user.favorited_by_type('Product')
  end

  def delete_favorites
    @favorites = current_user.favorited_by_type('Product')
    @favorites.remove_favorite
    redirect_to favorites_path
  end
end
