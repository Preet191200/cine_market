class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  helper_method :cart_count

  def cart_count
    cart = session[:cart] || {}
    cart.values.sum
  end

  def authenticate_admin_user!
    unless warden.authenticate(scope: :admin_user)
      redirect_to new_admin_user_session_path
    end
  end

  def current_admin_user
    @current_admin_user ||= warden.authenticate(scope: :admin_user)
  end
end