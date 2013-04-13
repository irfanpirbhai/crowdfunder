class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Signed up!"
      redirect_to :root
    else
      flash.now[:error] = "Please try again"
      render :new
    end
  end

end
