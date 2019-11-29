class Admin::SectorsController < Admin::AdminController
  before_action :set_sector, only: %w[edit update destroy]

  def index
    @admin_sectors = Sector.order(:position)
  end

  def new
    @admin_sector = Sector.new
  end

  def edit; end

  def create
    @admin_sector = Sector.new(admin_sector_params)
    if @admin_sector.save
      flash[:notice] = t('success_create_notice')
      redirect_to admin_sectors_path
    else
      render :new
    end
  end

  def update
    if @admin_sector.update(admin_sector_params)
      flash[:notice] = t('success_create_notice')
      redirect_to admin_sectors_path
    else
      render :edit
    end
  end

  def destroy
    @admin_sector.destroy
    flash[:notice] = t('success_delete_notice')
    redirect_to admin_sectors_path
  end

  private

  def set_sector
    @admin_sector = Sector.find(params[:id])
  end

  def admin_sector_params
    params.require(:sector).permit(
      :title_uk,
      :title_en,
      :description_uk,
      :description_en,
      :img,
      :remove_img,
      :position,
      :file
    )
  end
end
