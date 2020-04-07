class GithubController < ApplicationController
 before_action :authenticate_user!
 def index
  require 'github_api'
 
  github = Github.new

  @repos_from_github = github.repos.list(user: 'MamathaYarramaneni')

 end
end
