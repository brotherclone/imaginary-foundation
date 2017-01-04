class RecordsController < InheritedResources::Base
  helper_method :getRecords

  def index
    @wrapper = Discogs::Wrapper.new('Imaginary Albums', user_token: DiscogsConfig.config[:key])
    @recordCollection = []
    @current_group = 1
    gon.watch.currentGroup = @current_group
    @init_records = @wrapper.get_user_folder_releases(DiscogsConfig.config[:username],0)
    for p in 0..@init_records.pagination.pages
      gon.watch.recordCollection = getRecords(p)
    end
  end

  def getRecords(page)
    @recordCollection << @wrapper.get_user_folder_releases(DiscogsConfig.config[:username],0,{:page =>page})
  end
  
  private
    def record_params
      params.require(:record).permit(:records, :page,:sort,:sort_order,:per_page)
    end
end
