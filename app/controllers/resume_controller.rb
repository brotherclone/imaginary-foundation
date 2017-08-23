class ResumeController < ApplicationController
  add_breadcrumb 'Home', :root_path
  def index
    add_breadcrumb 'Resume', :resume_path
  end
end
