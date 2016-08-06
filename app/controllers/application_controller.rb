class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :all_locations
  helper_method :all_bedrooms
  helper_method :all_properties
  helper_method :all_posts
  before_filter :site_search
  
  def all_locations
  @locations = Location.all
  end
  
  def all_bedrooms
  @bedrooms = Bedroom.all
  end
  
  def all_properties
  @properties = Property.all
  end
  
  def all_posts
  @posts = Post.all
  end
  
  def site_search
  @q = Property.ransack(params[:q])
  @q_properties = @q.result.order("created_at DESC").page(params[:page]).per(8)
  end
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end