class PledgesController < ApplicationController
  before_filter :require_project
  before_filter :require_login

  def new
    @pledge = @project.pledges.build
  end

  def create
    @pledge = @project.pledges.build(params[:pledge])
    @pledge.user = current_user
    
    if @pledge.save
      flash[:success] = "Thanks for your support!"
      redirect_to @project

    else
      flash.now[:error] = "Woops! Something went wrong. Try again."
      render :new
    end
  end
  
  private

  def require_project
    @project = Project.find(params[:project_id])
  end

  def not_authenticated
    flash[:alert] = "Please log in."
    redirect_to login_path
  end

end

