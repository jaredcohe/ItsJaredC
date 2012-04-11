class UsersController < ApplicationController
  # rails g controller Users new
  # before_filter :authorize

  def new
    p params
    p "============="
    @user = User.new
    render :new, :layout => "bare"
  end

  def create
    p "Users Controller, Create Action"
    p params

    @user = User.new(params[:user])
    
    if @user.save

      p "AAAAAAAAAA"

      if params[:destination_controller] == "users" && params[:destination_action] == "me"
        p params
        p "11111111"
        redirect_to @user, :notice => "Signed up!"
      elsif params[:destination_controller] == "lesson_plantations" && params[:destination_action] == "new"
        p params
        p "2222222"
        redirect_to "lesson_plantations/new"
      elsif params[:destination_controller] == "home" && params[:destination_action] == "index"
        p params
        p "3333333"
        redirect_to "home/index"
      else
        p params
        p "444444"
        redirect_to :root, :notice => "Signed up!"
      end
    else
      p "5555555555"
      redirect_to :root
    end
  end

  def me
    p params
    p "=============="
    p "Users Controller, Me Action"
    if current_user
      p "000000"
      @user = current_user
      @lesson_plantation = LessonPlantation.where(:user_id => @user.id)
      @knowledges = Knowledge.where(:user_id => @user.id)
      render :show
    else
      @user = User.new
      render "/users/new", :layout => "bare"
    end
  end

end