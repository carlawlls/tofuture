class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @skip_navbar = true
  end
end
