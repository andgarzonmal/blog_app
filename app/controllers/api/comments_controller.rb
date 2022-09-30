class Api::CommentsController < ApplicationController
  before_action :authenticate_user!
  respond_to :json
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render json: { comments: @comments }, status: :ok
  end
end
