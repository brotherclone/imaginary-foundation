class RecordsController < InheritedResources::Base
  helper_method :getRecords

  def index
    @wrapper = Discogs::Wrapper.new('Imaginary Albums', user_token: DiscogsConfig.config[:key])
    @current_page = 1
    getRecords(@current_page)
  end

  def getRecords(page)
    @recordCollection =  @wrapper.get_user_collection(DiscogsConfig.config[:username], :page => page, :sort => 'title', :sort_order => 'asc', :per_page => 10)
  end




  private
    def record_params
      params.require(:record).permit()
    end
end

