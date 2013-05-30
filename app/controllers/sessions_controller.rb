class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create_local
    @user = User.new(params[:user])

    if @user.save
      redirect_to root_path, :notice => "You've successfully signed in #{@user.first_name}."
    else
      render 'new'
    end
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end


end
