class GithubUser
  def self.fetch_info(user)
    GithubService.get_user_info(user)
  end
end
