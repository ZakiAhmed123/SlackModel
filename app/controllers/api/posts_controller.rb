class Api::PostsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  before_filter :default_request_format

  def default_request_format
  request.format = :json
  end
  
  before_action do
    if @current_user.nil?
      # redirect_to sign_in_path
      render json: {authenticated: false}, status: 401
    end
  end

  def index
     @posts = Post.order("created_at desc")
  end

  def create
    @post = Post.new params.require(:post).permit(:text)
    @post.user = @current_user
    @post.room = Room.find_by(params[:id])
     if @post.save
      render :show
    else
      render json: {errors: @post.errors}, status: 422
    end
  end
end
