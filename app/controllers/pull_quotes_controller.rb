class PullQuotesController < InheritedResources::Base
  before_action :set_pull_quote, only:[:show, :edit, :update, :destroy]

  def index
    @pull_quotes = PullQuote.all
    gon.watch.pull_quotes =  @pull_quotes
  end

  def show
    gon.watch.pull_quote =  @pull_quote
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @pull_quote}
    end
  end

  def edit

  end

  def new
    @pull_quote = PullQuote.new
  end

  def create
    @pull_quote = PullQuote.new(pull_quote_params)
    respond_to do |format|
      if @pull_quote.save
        format.html { redirect_to @pull_quote, notice: 'Pull Quote was successfully created.' }
        format.json { render :show, status: :created, location: @pull_quote }
      else
        format.html { render :new }
        format.json { render json: @pull_quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @pull_quote = PullQuote.find(params[:id])
    respond_to do |format|
      if @pull_quote.save
        format.html { redirect_to @pull_quote, notice: 'Pull Quote added.' }
        format.json { render :show, status: :created, location: @pull_quote }
      else
        format.html { render :new }
        format.json { render json: @pull_quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    PullQuote.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to pull_quotes_path, notice: 'Pull Quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    def set_pull_quote
      @pull_quote = PullQuote.find(params[:id])
    end

    def pull_quote_params
      params.require(:pull_quote).permit(:quote,:essay_id)
    end
end

