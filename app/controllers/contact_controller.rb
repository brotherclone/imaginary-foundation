class ContactController < ApplicationController
  include NavigationHelper
  def index
    @page_title = 'Contact'
  end
end
