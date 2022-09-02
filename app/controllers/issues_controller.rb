class IssuesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @issues = Issue.all
    if params[:query].present?
      @issues = Issue.search_by_issue_name(params[:query])
    end
  end

  def show
    @user =
    @issue = Issue.find(params[:id])
  end
end
