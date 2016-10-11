class SessionsController < ApplicationController
  def create
    @response = Faraday.post(
      "https://github.com/login/oauth/access_token?" +
      "client_id=#{ENV['github_client_id']}&" +
      "client_secret=#{ENV['github_client_secret']}&" +
      "code=#{params['code']}"
    )
    token = @response.body.split(/\W+/)[1]
    oauth_response = Faraday.get(
      "https://api.github.com/user?" +
      "access_token=#{token}"
    )
require "pry"; binding.pry
    # hash = GithubOauthService.get_user_auth
    # user = User.find_from_oauth(hash)
  end

  # class GithubOauthService
  #   def self.get_user_auth
  #     @response = Faraday.post(
  #       "https://github.com/login/oauth/access_token?" +
  #       "client_id=#{ENV['github_client_id']}&" +
  #       "client_secret=#{ENV['github_client_secret']}&" +
  #       "code=#{params['code']}"
  #     )
  #
  #     token = @response.body.split(/\W+/)[1]
  #     oauth_response = Faraday.get(
  #       "https://api.github.com/user?" +
  #       "access_token=#{token}"
  #     )
  #   end
  # end
end


# Omniauth.mock_auth =
#  {name = "Calaway",
#    token = ENV["token"] }
#
#
# Faraday.get("url") do |f|
#   f.params[:access_token] = current_user.token
