class Admin::VideosController < Admin::AdminController
  before_action :set_admin_video, only: %w[show edit update destroy]

  def index
    @admin_videos = Video.all
  end

  def show; end

  def new
    @admin_video = Video.new
  end

  def edit; end

  def create
    @admin_video = Video.new(admin_video_params)
    if @admin_video.save
      flash[:notice] = t('success_create_notice')
      redirect_to admin_videos_path
    else
      render :new
    end
  end

  def update
    if @admin_video.update(admin_video_params)
      flash[:notice] = t('success_create_notice')
      redirect_to admin_videos_path
    else
      render :edit
    end
  end

  def destroy
    @admin_video.destroy
    flash[:notice] = t('success_delete_notice')
    redirect_to admin_videos_path
  end

  private

  def set_admin_video
    @admin_video = Video.find(params[:id])
  end

  def admin_video_params
    params.require(:video).permit(Video.globalize_attribute_names + [:video_position_id])
  end
end
