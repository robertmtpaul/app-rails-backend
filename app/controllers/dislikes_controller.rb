class DislikesController < ApplicationController
  before_action :find_dislike, only: [:destroy]
  before_action :find_post

  def create
    if already_disliked?
      flash[:notice] = "You can't dislike more than once"
    else
      @post.dislikes.create(user_id: @current_user.id)
      #If there is a leftover like, delete it to avoid having both like/dislikes for the same user.
      Like.where(user_id:@current_user.id, post_id:@post.id).destroy_all
    end
    redirect_to post_path(@post)
  end

  def destroy
    if !(already_disliked?)
      flash[:notice] = "Cannot undislike"
    else
      @dislike.destroy
    end
    redirect_to post_path(@post)
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_dislike
    find_post
    @dislike = @post.dislikes.find(params[:id])
  end

  def already_disliked?
    Dislike.where(user_id: @current_user.id, post_id:
    params[:post_id]).exists?
  end
end
