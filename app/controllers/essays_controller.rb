class EssaysController < InheritedResources::Base
  include NavigationHelper
  before_action :set_essay, only:[:show, :edit, :update, :destroy]

  def index
    @essays = Essay.all
    gon.watch.essays =  @essays
    @page_title = 'Essays'
  end

  def show
    gon.watch.essay =  @essay
    @clean = replace_with_directive(@essay)
    respond_to do |format|
      format.html { render :show }
      format.json { render :json => @essay}
    end
  end

  def replace_with_directive(essay)
    cleaner_pattern =  Regexp.new(/(\|\|\[)(.*)(\]\|\|)/)
    matches = essay.body.scan(cleaner_pattern)
    matches.each do |m|
      r= m[1].split(',')
      if r[0] == 'pull-quote'
        the_quote = PullQuote.find(r[1].to_i)
        pull_quote_directive  = "<div class='pull-quote'><i class='open'></i>" + the_quote.quote + "<i class='close'></i></div>"
        essay.body =  essay.body.gsub(/(\|\|\[pull-quote\,#{r[1]}\]\|\|)/,pull_quote_directive)
      elsif r[0] == 'image'
        the_image = Image.find(r[1].to_i)
        img_directive  = "<img src=''" + the_image.image_file + "'>"
        essay.body =  essay.body.gsub(/(\|\|\[image\,#{r[1]}\]\|\|)/,img_directive)
      end
    end
    essay.body
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

