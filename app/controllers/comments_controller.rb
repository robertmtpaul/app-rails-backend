class CommentsController < ApplicationController
  
  def create
    #find post by post_id
    @post = Post.find(params[:post_id])
    # get comments on post and go to comments model, then create comment on post.
    @comment = @post.comments.create(params[:comment].permit(:name, :comment, :post_id))
    redirect_to post_path(@post)
  end

  def destroy
    #
  end
end
