class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(oauth_data)
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def oauth_data
    request.env["omniauth.auth"]
  end
end
