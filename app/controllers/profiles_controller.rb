class ProfilesController < ApplicationController

  before_action :find_profile, except: :index
  before_action :admin_accessible, only: :index

  def index
    @user_profiles = Profile.latest.except_self(current_user.id)
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to edit_user_profile_path(id: @profile.id, user_id: @user.id)
    else
      render :edit
    end
  end

  private
    def find_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      if current_user.admin_own_profile?(@profile.user_id)
        params.require(:profile).permit(:phone_number)
      else
        params.require(:profile).permit(:address_line, :street, :landmark, :city, 
          :state, :pincode, :country, :display_picture, :phone_number)
      end
    end
end
