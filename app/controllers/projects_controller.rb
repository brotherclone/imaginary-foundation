class ProjectsController < InheritedResources::Base
  include NavigationHelper
  before_action :set_project, only:[:show, :edit, :update, :destroy]
  add_breadcrumb 'Home', :root_path
  def index
    add_breadcrumb 'Projects', :projects_path
    @projects = Project.all
    gon.watch.projects =  @projects
    @page_title = 'Projects'
    promo_cards = PromoCard.where(project_id: true)
    @project_cards = {}
    @projects.each do |e|
      promo_cards.each do |p|
        if e.id == p.project_id
          temp =  Image.find(p.image_id)
          card_name = 'card'+e.id.to_s
          @project_cards[ card_name ] = temp.image_file.to_s
        end
      end
    end
  end

  def show
    add_breadcrumb 'Projects', :projects_path
    add_breadcrumb @project.title, :project_path
    gon.watch.project =  @project
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @project}
    end
  end

  def edit

  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project added.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to projects_path, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end
    def project_params
      params.require(:project).permit(:title, :body, :description, :image_id)
    end
end

