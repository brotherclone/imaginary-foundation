class EssaysController < InheritedResources::Base

  private

    def essay_params
      params.require(:essay).permit()
    end
end

