class PostPhotosController < ApplicationController
  before_action :set_post_photo, only: [:show, :edit, :update, :destroy]

  # GET /post_photos
  # GET /post_photos.json
  def index
    @post_photos = PostPhoto.all
    # render json:Post.all
    # render json:PostPhoto.all
  end

  # GET /post_photos/1
  # GET /post_photos/1.json
  def show
  end

  # GET /post_photos/new
  def new
    @post_photo = PostPhoto.new
    # render json:PostPhoto.all
  end

  # GET /post_photos/1/edit
  def edit
  end

  # POST /post_photos
  # POST /post_photos.json
  def create

      if params[:images].present?
        params[:images].each do |image|
          req = Cloudinary::Uploader.upload(image)
          p image
          p req
          @post_photo = PostPhoto.new
          @post_photo.photo = req['public_id']
          if params[:post][:id].present?
            @post_photo.post_id = params[:post][:id]
          end
          @post_photo.user_id = @current_user.id
          puts "??????????????????????????????????????????????POST PHOTO????????????????????"
          p @post_photo

          @post_photo.save

          #TODO check whether each photo actually saved.
        end
      end


    respond_to do |format|
      if @post_photo.persisted?
        format.html do
          if params[:post][:id].present?
            #if a post id was specified in the form drop down, We assume that multiple photos were uploaded
            #so we redirect to the parent post show page of those photos.
            redirect_to post_path(params[:post][:id]), notice: 'Photos successfully added to Post.'
          else
            #if no post id was specified we assume this was a standalone photo upload without a parent post,
            #so we redirect to the photo show page.
            redirect_to @post_photo, notice: 'Post photo was successfully created.'
          end
        end
        format.json { render :show, status: :created, location: @post_photo }
      else
        format.html { render :new }
        format.json { render json: @post_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_photos/1
  # PATCH/PUT /post_photos/1.json
  def update
    respond_to do |format|
      if @post_photo.update(post_photo_params)
        format.html { redirect_to @post_photo, notice: 'Post photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_photo }
      else
        format.html { render :edit }
        format.json { render json: @post_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_photos/1
  # DELETE /post_photos/1.json
  def destroy
    @post_photo.destroy
    respond_to do |format|
      format.html { redirect_to post_photos_url, notice: 'Post photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_photo
      @post_photo = PostPhoto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_photo_params
      params.require(:post_photo).permit(:photo)
    end
end
