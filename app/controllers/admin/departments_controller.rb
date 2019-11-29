class Admin::DepartmentsController < Admin::AdminController
  before_action :set_admin_department, only: %w[show edit update destroy]

  def index
    @admin_departments = Department.order(:position)
  end

  def show; end

  def new
    @admin_department = Department.new
  end

  def edit; end

  def create
    @admin_department = Department.new(admin_department_params)
    if @admin_department.save
      flash[:notice] = t('success_create_notice')
      redirect_to admin_departments_path
    else
      render :new
    end
  end

  def update
    if @admin_department.update(admin_department_params)
      flash[:notice] = t('success_create_notice')
      redirect_to admin_departments_path
    else
      render :edit
    end
  end

  def destroy
    @admin_department.destroy
    flash[:notice] = t('success_delete_notice')
    redirect_to admin_departments_path
  end

  private

  def set_admin_department
    @admin_department = Department.find(params[:id])
  end

  def admin_department_params
    params.require(:department).permit(Department.globalize_attribute_names)
  end
end
