class GithubService
  def self.conn(token)
    Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params["access_token"] = token
    end
  end

  def self.get_user_info(user)
    response = conn(user.oauth_token).get "/user"
    JSON.parse(response.body)
  end

  def self.get_starred_repos(user)
    response = conn(user.oauth_token).get "/users/#{user.user_name}/starred"
    JSON.parse(response.body)
  end

  def self.get_followers(user)
    response = conn(user.oauth_token).get "/users/#{user.user_name}/followers"
    JSON.parse(response.body)
  end

  def self.get_following(user)
    response = conn(user.oauth_token).get "/users/#{user.user_name}/following"
    JSON.parse(response.body)
  end

  def self.get_repos(user)
    response = conn(user.oauth_token).get "/user/repos"
    JSON.parse(response.body)
  end

  def self.get_events(user)
    response = conn(user.oauth_token).get "/users/#{user.user_name}/events"
    JSON.parse(response.body)
  end
end
