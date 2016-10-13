class GithubStarredRepos
  def self.count(user)
    fetch_info(user).count
  end

  def self.fetch_info(user)
    GithubService.get_starred_repos(user)
  end
end
