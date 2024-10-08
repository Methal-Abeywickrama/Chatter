class PostsController < ApplicationController
  # before_action :send_mail, only: :create 

  def index 
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create 
    @post = current_user.profile.posts.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "Post created successfully"
    else  
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :image)
  end

  def send_mail 
    UserMailer.with(user: current_user).welcome_email.deliver_now
  end
end
