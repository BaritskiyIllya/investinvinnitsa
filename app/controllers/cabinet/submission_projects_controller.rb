class Cabinet::SubmissionProjectsController < Cabinet::CabinetController
  before_action :set_cabinet_submission_project, only: %i[show destroy]
  load_resource only: %i[index show]

  # GET /cabinet/submission_projects
  # GET /cabinet/submission_projects.json
  def index
    @cabinet_submission_projects = SubmissionProject.all.page(params[:page]).per(10)
  end

  # GET /cabinet/submission_projects/1
  # GET /cabinet/submission_projects/1.json
  def show; end

  # DELETE /cabinet/submission_projects/1
  # DELETE /cabinet/submission_projects/1.json
  def destroy
    @cabinet_submission_project.destroy
    respond_to do |format|
      format.html { redirect_to cabinet_submission_projects_url, notice: 'project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cabinet_submission_project
    @cabinet_submission_project = SubmissionProject.find(params[:id])
  end
end
