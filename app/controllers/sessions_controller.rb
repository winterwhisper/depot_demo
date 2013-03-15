class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      # session[:user_id] = user.id
      redirect_to admin_index_url, notice: "Logged in!"
    else
      render login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    # session[:user_id] = nil
    cookies.delete(:auth_token)
    redirect_to store_url, notice: "Logged out"
  end
end
