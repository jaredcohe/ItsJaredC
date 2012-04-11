class SessionsController < ApplicationController
  # rails g controller sessions new

  def new
  end

  def create
    p params
    p "Sessions Controller, Create Action"
    p "==================="

    @user = User.find_by_email(params[:email])

    p @user

    if @user && @user.authenticate(params[:password])
      #session[:user_id] = user.id
      if params[:rememeber_me]
        p "1111111"
        cookies.permanent[:auth_token] = @user.auth_token
      else
        p "22222"
        cookies[:auth_token] = @user.auth_token
      end

      if params[:destination_controller] == "users" && params[:destination_action] == "me"
        p "3333333"
        render "/users/show", :notice => "Logged in."
      elsif params[:destination_controller] == "lesson_plantations" && params[:destination_action] == "new"
        redirect_to "/lesson_plantations/new", :notice => "Logged in."
      elsif params[:destination_controller] == "home" && params[:destination_action] == "index"
        redirect_to "/home/index", :notice => "Logged in."
      else
        redirect_to :root, :notice => "Logged in."
      end
    else
      p "4444444"
      flash.now.alert = "Invalid email or password."
      render "/users/new"
    end
    p "555555"
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out."
  end

end
