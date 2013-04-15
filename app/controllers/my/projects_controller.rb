class My::ProjectsController < ApplicationController

  before_filter :require_login
  before_filter :require_project, :except => [:index, :new, :create]

  def index
    @user = current_user
    @projects = @user.projects.order('projects.created_at DESC').all
  end

  def new
    @user = current_user
    @project = @user.projects.new
  end

  def create
    @user = current_user
    @project = @user.projects.build(params[:project])
    
    if @project.save
      flash[:success] = "Your project has been created!"
      redirect_to my_projects_path
    else
      flash.now[:error] = "Woops! Something went wrong. Try again."
      render :new
    end
  end

  def edit
    
  end

  def update
    if @project.update_attributes(params[:project])
      flash[:success] = "Project updated!"
      redirect_to my_projects_path
    else
      flash.now[:error] = "Woops. There was an error."
      render :edit
    end
  end

  def destroy
    if @project.destroy
      flash[:success] = "Project deleted!"
      redirect_to my_projects_path
    else
      flash.now[:error] = "Woops. There was an error."
      render :edit
    end
  end

  private
  
  def not_authenticated
    flash[:alert] = "Please log in."
    redirect_to login_path
  end

  def require_project
    @project = Project.find(params[:id])
  end


end
