class SubmissionProjectsController < ApplicationController
  def create
    @submission_project = SubmissionProject.new(submission_project_params)
    flash[:notice] = if @submission_project.save
                       FeedbackMailer.send_submission_project_mail(@submission_project).deliver
                       I18n.t('success_send_questionnaire')
                     else
                       I18n.t('error_send_questionnaire')
                     end
    redirect_to invest_maps_path
  end

  private

  def submission_project_params
    params.require(:submission_project).permit(:description, :product, :market_analysis, :amount, :description_needs,
                                               :place, :area, :legal_status, :purpose, :current_use,
                                               :project_condition, :transport, :engineering, :resource, :assets,
                                               :workforce, :permission, :ecological, :privileges, :other, :name,
                                               :position, :address, :phone, :email)
  end
end
