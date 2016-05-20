class RoomsController < ApplicationController
  before_action :authenticate_user!

   before_action do
     @current_user = User.find_by id: session[:user_id]
     if @current_user.blank?
       redirect_to login_path
     end
   end

   def find
     @rooms=Room.all
     @room = Room.find_by id: params[:id]

   end

   def index
     @rooms = Room.all
     @room = Room.new
   end

   def show
     @room = Room.find_by id: params[:id]
     @rooms = Room.all

   end


   def new
     @room = Room.new
   end

   def create
     @room = Room.new params.require(:room).permit(:room_name)

     if @room.save
       redirect_to room_path(id: @room.id)
     else
       render :new
       flash.now[:alert] = "Add a Room Name Please"
     end
   end

   def delete
   end


end
