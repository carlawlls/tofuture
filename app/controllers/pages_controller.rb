class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @skip_navbar = true
  end

  def search
    @products = Product.all
    if params[:query].present?
      @products = Product.tagged_with(params[:query]) + Product.search_by_name_and_ticker(params[:query])

    end
    @issues = Issue.all
    if params[:query].present?
      @issues = Issue.search_by_issue_name(params[:query])
    end
  end
end


# params[:query].present?
#       @products = Product.search_by_name_and_ticker(params[:query])
