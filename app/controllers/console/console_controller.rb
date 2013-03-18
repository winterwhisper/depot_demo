class Console::ConsoleController < ApplicationController
  layout 'console'

  protected

  def authorize(role)
    if current_user.nil?
      redirect_to console_login_url, notice: "Please log in!"
    else
      if !(User::SUPER_USERS.include?(current_user.role))
        cookies.delete(:auth_token)
        redirect_to console_login_url, notice: "You are not a super user."
        return
      end
      if current_user.role < Settings.roles.fetch(role.capitalize)
        redirect_to console_url, notice: "You can`t access this page."
      end
    end
  end
end