class PostPhotosUsersController < ApplicationController
  before_action :set_post_photos_user, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin, only: [:index, :new, :show, :edit, :update, :destroy]

  # GET /post_photos_users
  # GET /post_photos_users.json
  def index
    @post_photos_users = PostPhotosUser.all
    render json:PostPhotosUser.all
  end

  # GET /post_photos_users/1
  # GET /post_photos_users/1.json
  def show
  end

  # GET /post_photos_users/new
  def new
    @post_photos_user = PostPhotosUser.new
    render json:PostPhotosUser.new
  end

  # GET /post_photos_users/1/edit
  def edit
  end

  # POST /post_photos_users
  # POST /post_photos_users.json
  def create
    @post_photos_user = PostPhotosUser.new(post_photos_user_params)

    respond_to do |format|
      if @post_photos_user.save
        format.html { redirect_to @post_photos_user, notice: 'Post photos user was successfully created.' }
        format.json { render :show, status: :created, location: @post_photos_user }
      else
        format.html { render :new }
        format.json { render json: @post_photos_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_photos_users/1
  # PATCH/PUT /post_photos_users/1.json
  def update
    respond_to do |format|
      if @post_photos_user.update(post_photos_user_params)
        format.html { redirect_to @post_photos_user, notice: 'Post photos user was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_photos_user }
      else
        format.html { render :edit }
        format.json { render json: @post_photos_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_photos_users/1
  # DELETE /post_photos_users/1.json
  def destroy
    @post_photos_user.destroy
    respond_to do |format|
      format.html { redirect_to post_photos_users_url, notice: 'Post photos user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_photos_user
      @post_photos_user = PostPhotosUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_photos_user_params
      params.require(:post_photos_user).permit(:user_id, :post_photo_id, :vote_photos)
    end
end
