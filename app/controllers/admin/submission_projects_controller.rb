class Admin::SubmissionProjectsController < Admin::AdminController
  before_action :set_admin_submission_project, only: %i[show destroy]
  load_resource only: %i[index show]

  # GET /admin/submission_projects
  # GET /admin/submission_projects.json
  def index
    @admin_submission_projects = SubmissionProject.all.page(params[:page]).per(10)
  end

  # GET /admin/submission_projects/1
  # GET /admin/submission_projects/1.json
  def show; end

  # DELETE /admin/submission_projects/1
  # DELETE /admin/submission_projects/1.json
  def destroy
    @admin_submission_project.destroy
    respond_to do |format|
      format.html { redirect_to admin_submission_projects_url, notice: 'project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_submission_project
    @admin_submission_project = SubmissionProject.find(params[:id])
  end
end
