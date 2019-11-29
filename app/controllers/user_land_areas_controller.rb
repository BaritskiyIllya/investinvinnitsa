class UserLandAreasController < ApplicationController
  def create
    @land_area = UserLandArea.new(land_area_params)
    flash[:notice] = if @land_area.save
                       FeedbackMailer.send_land_area_mail(@land_area).deliver
                       I18n.t('success_send_questionnaire')
                     else
                       I18n.t('error_send_questionnaire')
                     end
    redirect_to invest_maps_path
  end

  private

  def land_area_params
    params.require(:user_land_area).permit(:area_name, :area_type, :total_area, :underground_engin, :overhead_engin,
                                           :cadastral_number, :rent, :sale, :state_road_distance, :railway_distance,
                                           :airport_distance, :name, :phone, :email, :transfer_type, :classification,
                                           :configuration, :building_owner, :owner, :gas, :electricity, :water_supply,
                                           :drainager, :ethernet)
  end
end
