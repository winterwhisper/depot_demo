class ApplicationController < ActionController::Base
  protect_from_forgery

  private

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
