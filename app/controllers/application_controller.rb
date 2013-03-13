class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize

  protected

  def authorize
    unless User.find_by_id(session[:user_id])
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
