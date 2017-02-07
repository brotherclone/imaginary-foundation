class GalleriesController < InheritedResources::Base

  private

    def gallery_params
      params.require(:gallery).permit()
    end
end

