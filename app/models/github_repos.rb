class GithubRepos
  def self.fetch_info(user)
    GithubService.get_repos(user)
  end
end
