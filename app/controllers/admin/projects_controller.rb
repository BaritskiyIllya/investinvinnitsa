class Admin::ProjectsController < Admin::AdminController
  before_action :set_project, only: %w[show edit update destroy]

  def index
    @admin_projects = Project.all
  end

  def show; end

  def new
    @admin_project = Project.new
  end

  def edit; end

  def create
    @admin_project = Project.new(admin_project_params)
    if @admin_project.save
      flash[:notice] = t('success_create_notice')
      redirect_to admin_projects_path
    else
      render :new
    end
  end

  def update
    if @admin_project.update(admin_project_params)
      flash[:notice] = t('success_create_notice')
      redirect_to admin_projects_path
    else
      render :edit
    end
  end

  def destroy
    @admin_project.destroy
    flash[:notice] = t('success_delete_notice')
    redirect_to admin_projects_path
  end

  private

  def set_project
    @admin_project = Project.find(params[:id])
  end

  def admin_project_params
    permitted = Project.globalize_attribute_names + [:alias, project_images_attributes:
                                                               %i[id locale image imageable_id imageable_type _destroy]]
    params.require(:project).permit(permitted)
  end
end
