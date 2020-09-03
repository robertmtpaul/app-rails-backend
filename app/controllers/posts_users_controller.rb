class PostsUsersController < ApplicationController
  before_action :set_posts_user, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin


  # GET /posts_users
  # GET /posts_users.json
  def index
    @posts_users = PostsUser.all
    # render json:PostsUser.all
  end

  # GET /posts_users/1
  # GET /posts_users/1.json
  def show
  end

  # GET /posts_users/new
  def new
    @posts_user = PostsUser.new
    # render json:PostsUser.all
  end

  # GET /posts_users/1/edit
  def edit
  end

  # POST /posts_users
  # POST /posts_users.json
  def create
    @posts_user = PostsUser.new(posts_user_params)

    respond_to do |format|
      if @posts_user.save
        format.html { redirect_to @posts_user, notice: 'Posts user was successfully created.' }
        format.json { render :show, status: :created, location: @posts_user }
      else
        format.html { render :new }
        format.json { render json: @posts_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts_users/1
  # PATCH/PUT /posts_users/1.json
  def update
    respond_to do |format|
      if @posts_user.update(posts_user_params)
        format.html { redirect_to @posts_user, notice: 'Posts user was successfully updated.' }
        format.json { render :show, status: :ok, location: @posts_user }
      else
        format.html { render :edit }
        format.json { render json: @posts_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts_users/1
  # DELETE /posts_users/1.json
  def destroy
    @posts_user.destroy
    respond_to do |format|
      format.html { redirect_to posts_users_url, notice: 'Posts user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posts_user
      @posts_user = PostsUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def posts_user_params
      params.require(:posts_user).permit(:user_id, :post_id, :vote_post)
    end
end
