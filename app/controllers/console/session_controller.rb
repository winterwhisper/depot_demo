class Console::SessionController < Console::ConsoleController
  before_filter :logged_in, :only => [ :new, :create ]

  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = { :value => user.auth_token, :domain => ".lvh.me" }
      else
        cookies[:auth_token] = { :value => user.auth_token, :domain => ".lvh.me" }
      end
      redirect_to console_url, notice: "Logged in!"
    else
      redirect_to console_login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    cookies.delete :auth_token, :domain => ".lvh.me"
    redirect_to console_login_url, notice: "Logged out"
  end
end
