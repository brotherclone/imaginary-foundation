class ContactController < ApplicationController
  include NavigationHelper
  add_breadcrumb 'Home', :root_path
  def index
    add_breadcrumb 'Contact', :contact_path
    @page_title = 'Contact'
  end
end
