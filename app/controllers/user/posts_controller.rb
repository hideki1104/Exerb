class User::PostsController < ApplicationController

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	@post.save
  	redirect_to user_posts_path
  end


  def index
  	@user = current_user
  	@post = Post.new
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  	@user = current_user
  	@post_new = Post.new
  	@post_comment = PostComment.new
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	@post.update(post_params)
  	redirect_to user_posts_path
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.user_id = current_user.id
  	@post.destroy
  	redirect_to user_posts_path
  end

  private
    def post_params
        params.require(:post).permit(:impression,:user_id)
    end
end