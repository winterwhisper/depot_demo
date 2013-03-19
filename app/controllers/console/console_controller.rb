class Console::ConsoleController < ApplicationController
  layout 'console'

  protected

  def authorize(role)
    if current_user.nil?
      redirect_to console_login_url, notice: "Please log in!"
    else
      if !(User::SUPER_USERS.include?(current_user.role))
        redirect_to store_url(:host => request.domain), notice: "You are not a super user."
        return
      end
      if current_user.role < Settings.roles.fetch(role.capitalize)
        redirect_to console_url, notice: "You can`t access this page."
      end
    end
  end

  def logged_in
    if logged?
      redirect_to console_url, alert: "Already logged in."
    end
  end
end