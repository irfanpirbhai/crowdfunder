class ProjectsController < ApplicationController
  def index
    @projects = Project.page(params[:page]).per(8)
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
