class RelatedLinksController < InheritedResources::Base
  before_action :set_related_link, only:[:show, :edit, :update, :destroy]
  def index
    @related_links = RelatedLink.all
    @page_title = 'Related Sites'
    gon.watch.related_links =  @related_links
  end

  def show
    respond_to do |format|
      format.html { redirect_to @related_link.url}
      format.json { render :json => @related_link}
    end
  end

  def edit

  end

  def new
    @related_link = RelatedLink.new
  end

  def create
    @related_link = RelatedLink.new(related_link_params)
    respond_to do |format|
      if @related_link.save
        format.html { redirect_to @related_link, notice: 'Related Link was successfully created.' }
        format.json { render :show, status: :created, location: @related_link }
      else
        format.html { render :new }
        format.json { render json: @related_link.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @related_link = RelatedLink.find(params[:id])
    respond_to do |format|
      if @related_link.save
        format.html { redirect_to @related_link, notice: 'Related Link added.' }
        format.json { render :show, status: :created, location: @related_link }
      else
        format.html { render :new }
        format.json { render json: @related_link.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    RelatedLink.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to related_links_path, notice: 'Related Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    def set_related_link
      @related_link = RelatedLink.find(params[:id])
    end
    def related_link_params
      params.require(:related_link).permit()
    end
end

