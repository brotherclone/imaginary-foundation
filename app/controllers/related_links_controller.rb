class RelatedLinksController < InheritedResources::Base
  before_action :set_related_link, only:[:show, :edit, :update, :destroy]

  def index
    @related_links = RelatedLink.all
  end
  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @related_link}
    end
  end
  def create
    @related_link = RelatedLink.new(related_link_params)
    respond_to do |format|
      if @related_link.save
        format.html { redirect_to @related_link, notice: 'RelatedLink was successfully created.' }
        format.json { render :show, status: :created, location: @related_link }
      else
        format.html { render :new }
        format.json { render json: @related_link.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @mage = RelatedLink.find(params[:id])
    respond_to do |format|
      if @related_link.save
        format.html { redirect_to @related_link, notice: 'RelatedLink added.' }
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
      format.html { redirect_to related_links_path, notice: 'RelatedLink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
  def set_related_link
    @related_link = RelatedLink.find(params[:id])
  end
  def related_link_params
    params.require(:related_link).permit(:title, :url, :project_id)
  end
end

