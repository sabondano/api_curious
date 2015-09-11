class TwitterService
  attr_reader :connection

  def initialize(user)
    @connection ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['twitter_api_key']
      config.consumer_secret     = ENV['twitter_api_secret']
      config.access_token        = user.oauth_token
      config.access_token_secret = user.oauth_token_secret
    end
  end
end
