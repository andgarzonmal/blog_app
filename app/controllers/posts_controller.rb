class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @current_us = current_user
    @post = current_user.posts.new(params.require(:post).permit(:title, :text))
    @post.author = @current_us

    respond_to do |format|
      format.html do
        if @post.save
          redirect_to user_post_path(@current_us, @post)
        else
          render :new
        end 
      end
    end
  end
end
