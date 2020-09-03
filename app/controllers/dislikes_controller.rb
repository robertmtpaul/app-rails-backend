class DislikesController < ApplicationController
  # before_action :find_dislike, only: [:destroy]
  # before_action :find_post
  # before_action :check_if_admin

  def index
    @dislikes = Dislike.all
    # render json:Dislike.all
  end

  def create
    if already_disliked?
      flash[:notice] = "You can't dislike more than once"
    else
      Dislike.create user:@current_user, target_id:params[:target_id], target_type:params[:target_type]
      #If there is a leftover like, delete it to avoid having both like/dislikes for the same user.
      Like.where(user:@current_user, target_id:params[:target_id], target_type:params[:target_type]).destroy_all
    end
    render json:Dislike.all
    redirect_to request.referer
  end

  def destroy
    if !(already_disliked?)
      flash[:notice] = "Cannot undislike"
    else
      Dislike.where(user:@current_user, target_id:params[:target_id], target_type:params[:target_type]).destroy_all
    end
    redirect_to request.referer
  end

  private

  # def find_post
  #   @post = Post.find(params[:post_id])
  # end
  #
  # def find_dislike
  #   find_post
  #   @dislike = @post.dislikes.find(params[:id])
  # end

  def already_disliked?
    Dislike.where(user:@current_user, target_id:params[:target_id], target_type:params[:target_type]).exists?
  end
end
