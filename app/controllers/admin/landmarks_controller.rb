class Admin::LandmarksController < Admin::AdminController
  before_action :set_landmark, only: %w[edit update destroy]

  def index
    @admin_landmarks = Landmark.order(position: :asc)
  end

  def new
    @admin_landmark = Landmark.new
  end

  def edit; end

  def create
    @admin_landmark = Landmark.new(admin_landmark_params)
    if @admin_landmark.save
      flash[:notice] = t('success_create_notice')
      redirect_to admin_landmarks_path
    else
      render :new
    end
  end

  def update
    if @admin_landmark.update(admin_landmark_params)
      flash[:notice] = t('success_create_notice')
      redirect_to admin_landmarks_path
    else
      render :edit
    end
  end

  def destroy
    @admin_landmark.destroy
    flash[:notice] = t('success_delete_notice')
    redirect_to admin_landmarks_path
  end

  private

  def set_landmark
    @admin_landmark = Landmark.find(params[:id])
  end

  def admin_landmark_params
    params.require(:landmark).permit(
      :title_uk,
      :title_en,
      :img,
      :position
    )
  end
end
