class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
      flash[:success] = 'Post created!'
    else
      flash[:alert] = 'Oops, try again later'
      render 'new'
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :contact, :incentive, :tagline)
  end
end
