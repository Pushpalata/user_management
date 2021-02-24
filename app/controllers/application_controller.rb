class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    edit_users_profile_path(resource.profile)
  end

  def admin_accessible
    unless current_user.admin?
      redirect_to root_path , alert: "You don't have access to this page."
    end
  end

  protected

  def configure_permitted_parameters
    # Permit the `subscribe_newsletter` parameter along with the other
    # sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, 
      profile_attributes: [:id, :name, :address_line, :street, :landmark, :city, :state, :pincode, :country, 
      :phone_number, :display_picture]])
  end
end
