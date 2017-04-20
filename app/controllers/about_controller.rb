class AboutController < ApplicationController
  helper NavigationHelper
  def index
    @page_title = 'About'
    # git_hub = Octokit::Client.new(:login =>  ENV['GITHUB_USER'], :password =>  ENV['GITHUB_PASSWORD'])
    # @issues = git_hub.user
    Octokit.configure do |c|
      c.login = 'brotherclone@gmail.com'
      c.password = 'cr0wbarZ!'
    end
    repo = Octokit.repo 'brotherclone/imaginary-foundation'
    rel = repo.rels[:issues]
    issue_data = rel.get.data
    @issues = issue_data
  end
end
