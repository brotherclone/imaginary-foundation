class AboutController < ApplicationController
  helper NavigationHelper
  def index
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
