class LikesController < ApplicationController
  def new
    @post = Post.find_by(id: params[:post_id])
    if @post
      # Create a new Like for the post
      @post.likes.create(profile: current_user.profile)
      
      # Redirect to posts path
      redirect_to posts_path, notice: 'Post liked!'
    else
      # Handle the case where the post is not found
      redirect_to posts_path, alert: 'Post not found.'
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to posts_path
  end
end
