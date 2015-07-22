class UsersController < ApplicationController
  def new
    # this doesn't have to do anything but reroute
    @user = User.new
  end

  def create
    @user = User.create user_params
    # binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end

end
