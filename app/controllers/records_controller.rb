class RecordsController < InheritedResources::Base
  include NavigationHelper
  helper_method :getRecords
  add_breadcrumb 'Home', :root_path
  def index
    add_breadcrumb 'Record Collection', :records_path
    @wrapper = Discogs::Wrapper.new('Imaginary Albums', user_token: ENV['DISCOGS_KEY'])
    @recordCollection = []
    @current_group = 1
    gon.watch.currentGroup = @current_group
    @init_records = @wrapper.get_user_folder_releases('brotherclone',0)
    for p in 0..@init_records.pagination.pages
      gon.watch.recordCollection = getRecords(p)
    end
    @page_title = 'My Record Collection'
  end

  def getRecords(page)
    @recordCollection << @wrapper.get_user_folder_releases('brotherclone',0,{:page =>page})
  end
  
  private

    def record_params
      params.require(:record).permit(:records, :page,:sort,:sort_order,:per_page)
    end
end
