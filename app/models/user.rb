class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    user = User.find_or_create_by(provider: auth_info.provider, uid: auth_info.extra.raw_info.user_id)

    user.name               = auth_info.extra.raw_info.name
    user.provider           = auth_info.provider
    user.screen_name        = auth_info.extra.raw_info.screen_name
    user.uid                = auth_info.extra.raw_info.user_id
    user.oauth_token        = auth_info.credentials.token
    user.oauth_token_secret = auth_info.credentials.secret
    user.save

    user
  end

  def service
    @service ||= TwitterService.new(self)
  end

  def profile_image_url
    service.connection.user.profile_image_url
  end

  def tweets_count
    service.connection.user.tweets_count
  end

  def following_count
    service.connection.user.friends_count
  end

  def followers_count
    service.connection.user.followers_count
  end

  def home_timeline
    service.connection.home_timeline
  end

  def tweet(content)
    service.connection.update(content) unless content.length > 140
  end
end
