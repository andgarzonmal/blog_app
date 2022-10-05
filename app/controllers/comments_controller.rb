class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @comment = Comment.new
  end
  def update
  end 
  def create
    @current_us = current_user
    @comment = @current_us.comments.new(params.require(:comment).permit(:text))
    @comment.user_id = @current_us.id
    @comment.post_id = params[:post_id]

    respond_to do |format|
      format.html do
        if @comment.save
          redirect_to user_post_path(@current_us.id, Post.find(params[:post_id]))
        else
          render :new
        end
      end
    end
  end
end
