class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :check_if_logged_in, except: [:new, :create]
  # before_action :check_if_admin, except: [:show, :new, :edit, :update, :destroy]

  def follow
    @user = User.find(params[:id])
    @current_user.following << @user
    redirect_back(fallback_location: user_path(@user))
  end

  def posts
    @posts = Post.all
  end

  def unfollow
    @user = User.find(params[:id])
    @current_user.followed_users.find_by(followed_id: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    # render json:User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if params[:file].present?
      # actually forward uploaded file on to Cloudinary server
      response = Cloudinary::Uploader.upload params[:file]
      @user.profile_pic = response['public_id']
    end
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :email, :profile_pic, :admin)
    end
end
