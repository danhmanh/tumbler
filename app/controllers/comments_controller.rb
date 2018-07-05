class CommentsController < ApplicationController
  def create
    @comment = Comment.create comment_params
    redirect_to post_path @comment.post
  end

  private
  def comment_params
    params.required(:comment).permit(:post_id, :content).merge(user_id: current_user.id)
    # params.required(:comment).permit(:post_id, :content, :user_id => current_user.id)
  end
end
