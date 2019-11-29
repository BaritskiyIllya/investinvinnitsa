class Admin::AboutsController < Admin::AdminController
  before_action :set_about, only: %w[edit update]

  def index
    @admin_abouts = About.all
  end

  def show; end

  def new; end

  def edit; end

  def create; end

  def update
    if @admin_about.update(admin_about_params)
      flash[:notice] = t('success_create_notice')
      redirect_to admin_abouts_path
    else
      render :edit
    end
  end

  def destroy; end

  private

  def set_about
    @admin_about = About.find(params[:id])
  end

  def admin_about_params
    params.require(:about).permit(
      :name,
      :title_uk,
      :title_en,
      :information_uk,
      :information_en,
      :description_uk,
      :description_en,
      :alias,
      :position,
      project_images_attributes: %i[id locale image imageable_id imageable_type _destroy]
    )
  end
end
