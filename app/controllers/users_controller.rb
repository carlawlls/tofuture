class UsersController < ApplicationController
  def favorites
    @favorites = current_user.all_favorited
    # products
  end
end
