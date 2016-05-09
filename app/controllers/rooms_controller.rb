class RoomsController < ApplicationController
  before_action :authenticate_user!

   before_action do
     @current_user = User.find_by id: session[:user_id]
     if @current_user.blank?
       redirect_to login_path
     end
   end

   def index
     @rooms = Room.all
   end

   def show
     @room = Room.find_by id: params[:id]
   end

   def new
     @room = Room.new
   end

   def create
     @room = Room.new
     @room.room_name = params[:room][:room_name]

     if @room.save
       redirect_to rooms_path
     else
       render :new
     end
   end

   def delete
   end
end
