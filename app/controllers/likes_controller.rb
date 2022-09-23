class LikesController < ApplicationController
  def create
    @current_us = current_user
    @like = Like.new
    @like.user_id = @current_us.id
    @like.post_id = params[:post_id]

    respond_to do |format|
      format.html do
        redirect_to user_post_path(@current_us.id, Post.find(params[:post_id])) if @like.save
      end
    end
  end
end
