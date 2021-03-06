class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @posts = Post.order('created_at DESC').page(params[:page]).per(4)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else render 'posts/new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])

  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else render 'posts/edit'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order('created_at DESC').page(params[:page]).per(4)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end
end
