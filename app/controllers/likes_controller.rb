class LikesController < ApplicationController

  # before_action :find_like, only: [:destroy]
  # before_action :find_post

  def create

    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      # @post.likes.create(user_id: @current_user.id)
      Like.create user:@current_user, target_id:params[:target_id], target_type:params[:target_type]
      # Dislike.where(user:@current_user, target_id:params[:target_id], target_type:params[:target_type]).destroy_all
      Dislike.where(user:@current_user, target_id:params[:target_id], target_type:params[:target_type]).destroy_all
    end
    redirect_to request.referer
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      Like.where(user:@current_user, target_id:params[:target_id], target_type:params[:target_type]).destroy_all
    end
    redirect_to request.referer
  end

  private
  # def find_post
  #   @post = Post.find(params[:post_id])
  # end
  #
  # def find_like
  #   find_post
  #   @like = @post.likes.find(params[:target_id])
  # end
  #TODO make this also check target_type

  def already_liked?
    Like.where(user:@current_user, target_id:params[:target_id], target_type:params[:target_type]).exists?
  end


end
