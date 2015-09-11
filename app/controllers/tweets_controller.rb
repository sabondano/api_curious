class TweetsController < ApplicationController
  before_action :authorize!
 
  def tweet
    current_user.tweet(params[:tweet])

    redirect_to dashboard_path
  end

  def favorite
    current_user.favorite(params[:tweet_id])

    redirect_to dashboard_path
  end

end
