class IssuesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @issues = Issue.all
  end

  def show
    @issue = Issue.find(params[:id])
  end
end
