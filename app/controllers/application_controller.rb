class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize
  helper_method :current_user

  protected

  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end

  def authorize
    if current_user.nil?
      redirect_to login_url, notice: "Please log in"
    end
  end

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def count_access_times
    session[:count].nil? ? session[:count] = 1 : session[:count] += 1
  end

  def reset_access_counter
    session[:count] = 0
  end

end
