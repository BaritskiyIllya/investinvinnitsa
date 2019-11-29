class Admin::ContentsController < Admin::AdminController
  before_action :set_content, only: %w[edit update]

  def index
    @admin_contents = Content.all
  end

  def show; end

  def new; end

  def edit; end

  def create; end

  def update
    if @admin_content.update(admin_content_params)
      flash[:notice] = t('success_create_notice')
      redirect_to admin_contents_path
    else
      render :edit
    end
  end

  def destroy; end

  private

  def set_content
    @admin_content = Content.find(params[:id])
  end

  def admin_content_params
    params.require(:content).permit(Content.globalize_attribute_names + [:alias])
  end
end
