class GithubService
  def self.get_user_info(token)
    response = Faraday.get("https://api.github.com/user?access_token=#{token}")
    JSON.parse(response.body)
  end
end
