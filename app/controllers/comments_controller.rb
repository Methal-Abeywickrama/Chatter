class CommentsController < ApplicationController
  def create 
    commentable_type = params[:comment][:commentable_type]
    commentable_id = params[:comment][:commentable_id]
    @commentable = commentable_type.constantize.find(commentable_id)
    if commentable_type == 'Post'
      @comment = @commentable.comments.new(comment_params)

    else  
      @comment = @commentable.replies.new(comment_params)
    end

    @comment.profile = current_user.profile

    if @comment.save 
      flash[:notice] = "Comment was added successfully"
    else  
      flash[:notice] = "Comment failed"
    end
    redirect_to post_path(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
