class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
     @user = User.new
  end

  def create
     @user = User.new
     @user.email = params[:user][:email]
     @user.password = params[:user][:password]
     @user.password_confirmation = params[:user][:password_confirmation]

     if @user.save
       flash[:success] = "New user saved!"
       redirect_to root_url
     else
       flash[:alert] = "User not saved!"
       render :new
     end


  end
end
