class AboutController < ApplicationController
  helper NavigationHelper
  add_breadcrumb 'Home', :root_path
  def index
    add_breadcrumb 'About', :about_path
    @page_title = 'About'
        Octokit.configure do |c|
            c.login = ENV['GITHUB_USER']
            c.password = ENV['GITHUB_PASSWORD']
          end
        repo = Octokit.repo 'brotherclone/imaginary-foundation'
        rel = repo.rels[:issues]
        issue_data = rel.get.data
        @issues = issue_data
  end
end
