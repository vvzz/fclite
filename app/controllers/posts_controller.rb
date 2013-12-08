class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    respond_with Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.save
    render json: @post, status: 201
  end

  private
    def post_params
      params.require(:post).permit(:description, :monthly, :security)
    end
end
