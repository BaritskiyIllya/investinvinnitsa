class PotentialInvestorsController < ApplicationController
  def create
    @potential_investor = PotentialInvestor.new(potential_investor_params)
    flash[:notice] = if @potential_investor.save
                       FeedbackMailer.send_potential_investor_mail(@potential_investor).deliver
                       I18n.t('success_send_questionnaire')
                     else
                       I18n.t('error_send_questionnaire')
                     end
    redirect_to invest_maps_path
  end

  private

  def potential_investor_params
    params.require(:potential_investor).permit(:company_name, :branch, :product_description, :project_description,
                                               :novelty, :budget, :object, :land_area, :area_type, :infrastructure,
                                               :area, :transfer_type, :workers, :skilled_workers,
                                               :ownership, :partners, :comment, :project_cost, :name,
                                               :phone, :fax, :email, :site, :other_info,
                                               representative_attributes: %i[
                                                 name phone fax email site other_info additional
                                               ])
  end
end
