class ProfilesController < ApplicationController
  include DeleteCropperImage

  before_action :set_profile
  layout 'profile'

  def edit_profile
    render 'edit'
  end

  def update_profile
    delete_image?(params[:user][:image], @profile)
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to edit_profile_path, notice: 'Профіль успішно змінено.' }
        format.json {}
      else
        format.html { render 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_profile
    @profile = current_user
  end

  def profile_params
    params.require(:user).permit(
      :last_name,
      :first_name,
      :middle_name,
      :gender,
      :birth_date,
      :phone,
      :position,
      :email,
      :image
    )
  end
end
