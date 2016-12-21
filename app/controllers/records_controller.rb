class RecordsController < InheritedResources::Base

  def index
    @wrapper = Discogs::Wrapper.new('Imaginary Albums', user_token: DiscogsConfig.config[:key])
    @recordCollection =  @wrapper.get_user_collection(DiscogsConfig.config[:username])
  end

  private

    def record_params
      params.require(:record).permit()
    end
end

