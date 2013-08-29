class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    respond_with Post.all
  end
end
