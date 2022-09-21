class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @last_3_posts = @user.recent_3_posts
  end
end
