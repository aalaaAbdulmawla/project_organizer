class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :set_full_name, if: :devise_controller?

  def set_full_name
    user = User.order("created_at").last
    user.name = "#{user.first_name} #{user.last_name}"
    user.save
  end
 
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :password << :password_confirmation << :email << :avatar << :full_name
  end 
 
   def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
   end

end
