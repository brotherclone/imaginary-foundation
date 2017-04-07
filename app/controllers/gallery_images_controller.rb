class GalleryImagesController < InheritedResources::Base
  before_action :set_gallery_image, only:[:show, :edit, :update, :destroy]

  def index
    @gallery_images = GalleryImage.all
  end

  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @gallery_image}
    end
  end

  def create
    @gallery_image = GalleryImage.new(gallery_image_params)
    respond_to do |format|
      if @gallery_image.save
        format.html { redirect_to @gallery_image, notice: 'GalleryImage was successfully created.' }
        format.json { render :show, status: :created, location: @gallery_image }
      else
        format.html { render :new }
        format.json { render json: @gallery_image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @gallery_image = GalleryImage.find(params[:id])
    respond_to do |format|
      if @gallery_image.save
        format.html { redirect_to @gallery_image, notice: 'GalleryImage added.' }
        format.json { render :show, status: :created, location: @gallery_image }
      else
        format.html { render :new }
        format.json { render json: @gallery_image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    GalleryImage.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to gallery_images_path, notice: 'GalleryImage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_gallery_image
    @gallery_image = GalleryImage.find(params[:id])
  end

  def gallery_image_params
    params.require(:gallery_image).permit(:gallery_id, :image_id)
  end

end

