class UsersController < ApplicationController
  def show
    @user_info = GithubUser.fetch_info(current_user)
    @starred_repo_count = GithubStarredRepos.count(current_user)
    @followers = GithubFollowers.fetch_info(current_user)
    @followees = GithubFollowing.fetch_info(current_user)
    @repos = GithubRepos.fetch_info(current_user)
    @events = GithubEvents.formatted_events(current_user)
  end
end
