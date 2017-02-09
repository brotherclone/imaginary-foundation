class ImagesController < InheritedResources::Base
  before_action :set_image, only:[:show, :edit, :update, :destroy]

  def index
    @images = Image.all
  end
  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @image}
    end
  end
  def edit

  end
  def update

  end
  def destroy

  end
  private
    def set_image
      @image = Image.find(params[:id])
    end
    def image_params
      params.require(:image).permit(:image_file)
    end
end

