class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @comment =  @post.comments.create comment_params
    redirect_to post_path @post
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:post_id])
    @comment.destroy
    redirect_to post_path @post
  end

  private

  def comment_params
    params.required(:comment).permit(:post_id, :content).merge(user_id: current_user.id)
  end
end
