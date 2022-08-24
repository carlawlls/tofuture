class UsersController < ApplicationController
  def favorites
    @favorites = current_user.favorited_by_type('Product')
  end
end
