class SessionsController < ApplicationController

  def new
    # render plain: 'new session'
  end

  def create
    @user= User.authenticate(params[:user][:email],
      params[:user][:password])
    # binding.pry

    if @user
      # binding.pry
      session[:user_id] = @user.id
      # binding.pry
      flash[:success] = 'You are now logged in.'
      redirect_to root_path
    else
      # binding.pry
      flash[:danger]= 'Invalid email or password'

      redirect_to login_path
    end
  end

    def destroy
      session[:user_id] = nil
      flash[:info] = 'You are logged out.'
      redirect_to login_path
    end

end