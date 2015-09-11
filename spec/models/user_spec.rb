require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a name, provider, screen_name, uid, oauth_token, oauth_token_secret" do
    User.create(name: "Sebastian Abondano",
                provider: "twitter",
                screen_name: "sabondano1",
                uid: "12345",
                oauth_token: "token",
                oauth_token_secret: "secret")

    user = User.first

    expect(user.name).to eq("Sebastian Abondano")
    expect(user.provider).to eq("twitter")
    expect(user.screen_name).to eq("sabondano1")
    expect(user.uid).to eq("12345")
    expect(user.oauth_token).to eq("token")
    expect(user.oauth_token_secret).to eq("secret")
  end

  it "can connect to a Twitter::REST::Client" do
    User.create(name: "Sebastian Abondano",
                provider: "twitter",
                screen_name: "sabondano1",
                uid: "12345",
                oauth_token: ENV["twitter_access_token"],
                oauth_token_secret: ENV["twitter_access_token_secret"])

    user = User.first

    expect(user.service.connection.class).to eq(Twitter::REST::Client)
  end

  it "can retrieve a #profile_image_url" do
    VCR.use_cassette('user_retrieves#profile_image_url') do
      User.create(name: "Sebastian Abondano",
                  provider: "twitter",
                  screen_name: "sabondano1",
                  uid: "12345",
                  oauth_token: ENV["twitter_access_token"],
                  oauth_token_secret: ENV["twitter_access_token_secret"])

      user = User.first

      expect(user.profile_image_url.to_s).to eq('http://pbs.twimg.com/profile_images/519994762581925888/QHOq7CeP_normal.jpeg')
    end
  end

  it "can retrieve #tweets_count" do
    VCR.use_cassette('user_retrieves#tweet_count') do
      User.create(name: "Sebastian Abondano",
                  provider: "twitter",
                  screen_name: "sabondano1",
                  uid: "12345",
                  oauth_token: ENV["twitter_access_token"],
                  oauth_token_secret: ENV["twitter_access_token_secret"])

      user = User.first
      tweets_count = user.tweets_count

      expect(tweets_count.class).to eq(Fixnum)
    end
  end

  it "can retrieve #following_count" do
    VCR.use_cassette('user_retrieves#following_count') do
      User.create(name: "Sebastian Abondano",
                  provider: "twitter",
                  screen_name: "sabondano1",
                  uid: "12345",
                  oauth_token: ENV["twitter_access_token"],
                  oauth_token_secret: ENV["twitter_access_token_secret"])

      user = User.first
      following_count = user.following_count

      expect(following_count.class).to eq(Fixnum)
    end
  end

  it "can retrieve #followers_count" do
    VCR.use_cassette('user_retrieves#followers_count') do
      User.create(name: "Sebastian Abondano",
                  provider: "twitter",
                  screen_name: "sabondano1",
                  uid: "12345",
                  oauth_token: ENV["twitter_access_token"],
                  oauth_token_secret: ENV["twitter_access_token_secret"])

      user = User.first
      followers_count = user.followers_count

      expect(followers_count.class).to eq(Fixnum)
    end
  end

  it "can retrieve #home_timeline" do
    VCR.use_cassette('user_retrieves#home_timeline') do
      User.create(name: "Sebastian Abondano",
                  provider: "twitter",
                  screen_name: "sabondano1",
                  uid: "12345",
                  oauth_token: ENV["twitter_access_token"],
                  oauth_token_secret: ENV["twitter_access_token_secret"])

      user = User.first
      home_timeline = user.home_timeline

      expect(home_timeline.count).to eq(20)
      expect(home_timeline.first.class).to eq(Twitter::Tweet)
    end
  end

  it "can post #tweet" do
    VCR.use_cassette('user_posts#tweet') do
      User.create(name: "Sebastian Abondano",
                  provider: "twitter",
                  screen_name: "sabondano1",
                  uid: "12345",
                  oauth_token: ENV["twitter_access_token"],
                  oauth_token_secret: ENV["twitter_access_token_secret"])

      user = User.first
      tweet = user.tweet('Testing, 1, 2.')

      expect(tweet.class).to eq(Twitter::Tweet)
    end
  end

  it "can favorite a #tweet" do
    VCR.use_cassette('user_favorites#tweet') do
      User.create(name: "Sebastian Abondano",
                  provider: "twitter",
                  screen_name: "sabondano1",
                  uid: "12345",
                  oauth_token: ENV["twitter_access_token"],
                  oauth_token_secret: ENV["twitter_access_token_secret"])

      user = User.first
      tweet = user.favorite(642382895835926528)

      expect(tweet.first.favorited?).to eq(true)
    end
  end

  it "can retweet a #tweet" do
    VCR.use_cassette('user_#retweet') do
      User.create(name: "Sebastian Abondano",
                  provider: "twitter",
                  screen_name: "sabondano1",
                  uid: "12345",
                  oauth_token: ENV["twitter_access_token"],
                  oauth_token_secret: ENV["twitter_access_token_secret"])

      user = User.first
      tweet = user.retweet(642382895835926528)

      expect(tweet.first.retweeted?).to eq(true)
    end
  end

  it "can reply to a #tweet" do
    VCR.use_cassette('user_#reply_to_tweet') do
      User.create(name: "Sebastian Abondano",
                  provider: "twitter",
                  screen_name: "sabondano1",
                  uid: "12345",
                  oauth_token: ENV["twitter_access_token"],
                  oauth_token_secret: ENV["twitter_access_token_secret"])

      user = User.first
      tweet = user.reply('@oldpicsarchive Testing, 1, 2.', 642382895835926528)

      expect(tweet.reply?).to eq(true)
    end
  end
end
