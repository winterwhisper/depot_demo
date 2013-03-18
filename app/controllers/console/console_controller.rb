class Console::ConsoleController < ApplicationController
  layout 'console'

  protected

  def authorize(role)
    if current_user.nil?
      redirect_to console_login_url, notice: "Please log in!"
    else
      if current_user.role < Settings.roles.fetch(role.capitalize)
        redirect_to console_url, notice: "You can`t access this page."
      end
    end
  end
end