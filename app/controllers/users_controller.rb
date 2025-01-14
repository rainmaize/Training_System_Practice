class UsersController < ApplicationController
  def show
    return if @user = User.find_by(id: params[:id])
    flash[:danger] = t "user_not_found"
    redirect_to root_url
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) # Not the final implementation!
    if @user.save
      flash[:success] = t "hello"
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :email, :password,
      :password_confirmation
  end
end
