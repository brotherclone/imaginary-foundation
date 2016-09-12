class EssaysController < InheritedResources::Base
  def index
    @essays = Essay.all
  end

  def show
    @last_essays = Essay.all
    @essay = Essay.find(params[:id])
  end

  private

  def essay_params
      params.require(:essay).permit(:title, :description, :body, :imageable)
  end

end

