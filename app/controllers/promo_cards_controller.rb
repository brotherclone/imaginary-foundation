class PromoCardsController < InheritedResources::Base
  before_action :set_promo_card, only:[:show, :edit, :update, :destroy]

  def index
    @promo_cards = PromoCard.all
    gon.watch.promo_cards=  @promo_cards
  end

  def show
    gon.watch.promo_card =  @promo_card
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @promo_card}
    end
  end

  def edit

  end

  def new
    @promo_card  = PromoCard.new
  end

  def create
    @promo_card  = PromoCard.new(promo_card_params)
    respond_to do |format|
      if @promo_card.save
        format.html { redirect_to @promo_card , notice: 'Promo Card was successfully created.' }
        format.json { render :show, status: :created, location: @promo_card  }
      else
        format.html { render :new }
        format.json { render json: @promo_card .errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @promo_card  = PromoCard.find(params[:id])
    respond_to do |format|
      if @promo_card.save
        format.html { redirect_to @promo_card , notice: 'Promo Card added.' }
        format.json { render :show, status: :created, location: @promo_card  }
      else
        format.html { render :new }
        format.json { render json: @promo_card .errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    PromoCard.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to promo_cards_path, notice: 'Promo Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_promo_card
    @promo_card = PromoCard.find(params[:id])
  end

  def promo_card_params
    params.require(:promo_card).permit(:essay_id, :project_id, :image_id)
  end
end

