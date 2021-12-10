class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.image.attach(user_params[:image])
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to users_path
    else
      flash.alert = "Error"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash.notice = "Record deleted"
      redirect_to users_path
    else
      flash.alert = "Can't delete record"
      redirect_to users_path
    end
  end

private

  def user_params
    params.require(:user).permit(:title, :name, :image)
  end
end
