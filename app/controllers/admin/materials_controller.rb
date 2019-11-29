class Admin::MaterialsController < Admin::AdminController
  before_action :set_admin_material, only: %w[show edit update destroy]

  def index
    @admin_materials = Material.all.page(params[:page])
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def show; end

  def new
    @admin_material = Material.new
  end

  def edit; end

  def create
    @admin_material = Material.new(admin_material_params)
    if @admin_material.save
      flash[:notice] = t('success_create_notice')
      redirect_to admin_materials_path
    else
      render :new
    end
  end

  def update
    if @admin_material.update(admin_material_params)
      flash[:notice] = t('success_create_notice')
      redirect_to admin_materials_path
    else
      render :edit
    end
  end

  def destroy
    @admin_material.destroy
    flash[:notice] = t('success_delete_notice')
    redirect_to admin_materials_path
  end

  private

  def set_admin_material
    @admin_material = Material.find(params[:id])
  end

  def admin_material_params
    params.require(:material).permit(
      :link,
      :title_uk,
      :title_en,
      :description_uk,
      :description_en,
      project_files_attributes: %i[id locale file fileable_id fileable_type _destroy],
      project_images_attributes: %i[id locale image imageable_id imageable_type _destroy]
    )
  end
end
