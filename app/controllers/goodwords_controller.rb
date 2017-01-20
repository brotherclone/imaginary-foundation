class GoodwordsController < InheritedResources::Base

  private

    def goodword_params
      params.require(:goodword).permit()
    end
end

