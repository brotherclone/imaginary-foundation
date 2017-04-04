class GalleryImagesController < InheritedResources::Base
  before_action :set_gallery_image, only:[:show, :edit, :update, :destroy]

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def set_gallery_image
    @gallery_image = GalleryImage.find(params[:id])
  end
  def galley_image_paramsparams
    params.require(:gallery_image).permit(:gallery_id)
  end
end

