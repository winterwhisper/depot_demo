class Console::SessionController < Console::ConsoleController
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
      redirect_to console_url, notice: "Logged in!"
    else
      redirect_to console_login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to console_login_url, notice: "Logged out"
  end
end