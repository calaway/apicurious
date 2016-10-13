class GithubFollowing
  def self.fetch_info(user)
    GithubService.get_following(user)
  end
end
