class GithubFollowers
  def self.fetch_info(user)
    GithubService.get_followers(user)
  end
end
