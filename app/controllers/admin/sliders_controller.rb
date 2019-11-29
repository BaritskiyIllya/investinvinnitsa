class Admin::SlidersController < Admin::AdminController
  before_action :set_admin_slider, only: %i[edit update destroy]

  def index
    @admin_sliders = Slider.all
  end

  def show; end

  def new
    @admin_slider = Slider.new
  end

  def edit; end

  def create
    @admin_slider = Slider.new(admin_slider_params)

    respond_to do |format|
      if @admin_slider.save
        format.html { redirect_to admin_sliders_path, notice: 'Слайд успішно створено.' }
        format.json { render :show, status: :created, location: @admin_slider }
      else
        format.html { render :new }
        format.json { render json: @admin_slider.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_slider.update(admin_slider_params)
        format.html { redirect_to admin_sliders_path, notice: 'Слайд успішно оновлено.' }
        format.json { render :show, status: :ok, location: @admin_slider }
      else
        format.html { render :edit }
        format.json { render json: @admin_slider.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_slider.destroy
    respond_to do |format|
      format.html { redirect_to admin_sliders_path, notice: 'Слайд успішно видалено.' }
      format.json { head :no_content }
    end
  end

  private

  def set_admin_slider
    @admin_slider = Slider.find(params[:id])
  end

  def admin_slider_params
    permitted = Slider.globalize_attribute_names + [project_images_attributes:
                                                      %i[id locale image imageable_id imageable_type _destroy]]
    params.require(:slider).permit(permitted)
  end
end
