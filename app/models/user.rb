class User < ApplicationRecord
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid         = auth_info.uid
      new_user.user_name   = auth_info.info.nickname
      new_user.oauth_token = auth_info.credentials.token
    end
  end
end
