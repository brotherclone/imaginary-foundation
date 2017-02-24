class EssaysController < InheritedResources::Base

  before_action :set_essay, only:[:show, :edit, :update, :destroy]

  def index
    @essays = Essay.all
    gon.watch.essays =  @essays
  end

  def show
    gon.watch.essay =  @essay
    respond_to do |format|
      format.html { render :show }
      format.json { render :json => @essay}
    end
  end

  def edit

  end

  def new
    @essay = Essay.new
  end

  def create
    @essay = Essay.new(essay_params)
    respond_to do |format|
      if @essay.save
        format.html { redirect_to @essay, notice: 'Essay was successfully created.' }
        format.json { render :show, status: :created, location: @essay }
      else
        format.html { render :new }
        format.json { render json: @essay.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @essay = Essay.find(params[:id])
    respond_to do |format|
      if @essay.save
        format.html { redirect_to @essay, notice: 'Essay added.' }
        format.json { render :show, status: :created, location: @essay }
      else
        format.html { render :new }
        format.json { render json: @essay.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Essay.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to essays_path, notice: 'Essay was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_essay
    @essay = Essay.find(params[:id])
  end

  def essay_params
    params.require(:essay).permit(:title, :body, :description)
  end
end

