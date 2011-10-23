class SessionsController < ApplicationController
  # rails g controller sessions new

  def new
    p params
    p "00000000000000"
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      #session[:user_id] = user.id
      if params[:rememeber_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to root_url, :notice => "Logged in."
    else
      flash.now.alert = "Invalid email or password."
      render "new"
    end
    p "params from create session"
    p params
    p "111111111111111"
  end

  def destroy
    #session[:user_id] = nil
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out."
    p params
    p "000000000000000"
  end

end
