class UsersController < ApplicationController
  def show
    @user_info = GithubUser.fetch_info(current_user.oauth_token)
  end
end
