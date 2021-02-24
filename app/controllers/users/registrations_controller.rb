class Users::RegistrationsController < Devise::RegistrationsController

  # GET /users/sign_up
  def new
    # Override Devise default behaviour and create a profile
    build_resource({})
    resource.build_profile
    respond_with self.resource
  end
  
end