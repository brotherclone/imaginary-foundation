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
  def create
    @image = Image.new(image_params)
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @mage = Image.find(params[:id])
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image added.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Image.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to images_path, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    def set_image
      @image = Image.find(params[:id])
    end
    def image_params
      params.require(:image).permit(:image_file, :title, :caption, :credit, :credit_link)
    end
end

