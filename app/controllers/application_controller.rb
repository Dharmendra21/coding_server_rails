class ApplicationController < ActionController::Base
  # add filters
  protect_from_forgery 
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  # helper_method :current_user, :signed_in?, :is_admin?
  
  protected
  
  # permit devise parameters
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :re_enter_email])
    # devise_parameter_sanitizer.permit :account_update, keys: first_name
  end
  
  rescue_from CanCan::AccessDenied do |exception|
	  flash[:error] = "Access denied."
	  redirect_to root_url
  end
end