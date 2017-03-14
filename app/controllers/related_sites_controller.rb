class RelatedSitesController < ApplicationController
  include NavigationHelper
  def index
    @page_title = 'Related Sites'
  end
end
