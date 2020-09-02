class CommentsController < ApplicationController
  def create
    # RAILS:
    #find post by post_id
    @post = Post.find(params[:post_id])
    # get comments on post and go to comments model, then create comment on post.
    @comment = @post.comments.create(params[:comment].permit(:name, :content, :post_id))
    redirect_to post_path(@post)
    respond_to do |format|
      format.html
      format.json {render json: @comment}
    end
  end
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
