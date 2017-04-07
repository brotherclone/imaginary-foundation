class GalleriesController < InheritedResources::Base

  before_action :set_gallery, only:[:show, :edit, :update, :destroy]

  def index
    @galleries = Gallery.all
  end

  def show
      respond_to do |format|
        format.html { render :show }
        format.json { render :json => @gallery}
      end
  end

  def edit
  
  end
  
  def new
    @gallery = Gallery.new
  end
  
  def create
    @gallery = Gallery.new(gallery_params)
    respond_to do |format|
      if @gallery.save
        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
        format.json { render :show, status: :created, location: @gallery }
      else
        format.html { render :new }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @gallery = Gallery.find(params[:id])
    respond_to do |format|
      if @gallery.save
        format.html { redirect_to @gallery, notice: 'Gallery added.' }
        format.json { render :show, status: :created, location: @gallery }
      else
        format.html { render :new }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @gallery = Gallery.find(params[:id])
    respond_to do |format|
      if @gallery.destroy
        format.html { redirect_to galleries_path, notice: 'Gallery was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(:title)
  end

end
