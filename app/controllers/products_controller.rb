class ProductsController < ApplicationController

  before_action :authenticate_user!
  include Pundit::Authorization

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller]
  end
end
