class ProjectsController < ApplicationController
  def index
    @projects = Project.all
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
