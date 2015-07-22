class UsersController < ApplicationController
  def new
    # this doesn't have to do anything but reroute
    @user = User.new
  end

  def create
    @user = User.create user_params
    # binding.pry

    if @user
      flash[:success] = 'User credentials created. You are now logged in'
      # flash[:success] = 'You are now logged in!'
      # redirect_to login_path
      redirect_to login_path
    else
      flash[:danger]= 'Invalid email or password'

      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end

end
