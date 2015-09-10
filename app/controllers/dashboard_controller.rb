class DashboardController < ApplicationController
  before_action :authorize!

  def show
  end

  def tweet
    current_user.tweet(params[:tweet])

    redirect_to dashboard_path
  end
end
