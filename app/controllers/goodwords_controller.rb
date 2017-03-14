class GoodwordsController < InheritedResources::Base
  include NavigationHelper
  before_action :set_goodword, only:[:show, :edit, :update, :destroy]

  def index
    @goodwords = Goodword.all
    gon.watch.goodwords =  @goodwords
  end

  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @goodword}
    end
  end

  def edit

  end

  def new
    @goodword = Goodword.new
  end

  def create
    @goodword = Goodword.new(goodword_params)
    respond_to do |format|
      if @goodword.save
        format.html { redirect_to @goodword, notice: 'Good word was successfully created.' }
        format.json { render :show, status: :created, location: @goodword }
      else
        format.html { render :new }
        format.json { render json: @goodword.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @goodword = Goodword.find(params[:id])
    respond_to do |format|
      if @goodword.save
        format.html { redirect_to @goodword, notice: 'Good Word added.' }
        format.json { render :show, status: :created, location: @goodword }
      else
        format.html { render :new }
        format.json { render json: @goodword.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    Goodword.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to goodwords_path, notice: 'Good Word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_goodword
    @goodword = Goodword.find(params[:id])
  end
  def goodword_params
    params.require(:goodword).permit(:word, :good, :fromURL)
  end
end
