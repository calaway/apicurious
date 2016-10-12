class GithubUser
  def self.fetch_info(token)
    GithubService.get_user_info(token)
  end
end
