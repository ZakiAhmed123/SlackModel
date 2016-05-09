class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def create
    @user = User.new params.require(:user).permit(:user_name, :password, :photo, :first_name, :last_name, :email)
   if @user.save
     session[:user_id] = @user.id
     redirect_to rooms_path
   else
     render :new
   end
  end

end
