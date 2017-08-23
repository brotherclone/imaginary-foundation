class PrivacyController < ApplicationController
  include NavigationHelper
  add_breadcrumb 'Home', :root_path
  def index
    add_breadcrumb 'Privacy', :privacy_path
    @page_title = 'Privacy'
  end
end
