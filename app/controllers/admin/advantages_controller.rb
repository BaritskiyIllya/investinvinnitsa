class Admin::AdvantagesController < Admin::AdminController
  before_action :set_advantage, only: %w[show edit update destroy]

  def index
    @admin_advantages = Advantage.all
  end

  def show; end

  def new
    @admin_advantage = Advantage.new
  end

  def edit; end

  def create
    @admin_advantage = Advantage.new(admin_advantage_params)
    if @admin_advantage.save
      flash[:notice] = t('success_create_notice')
      redirect_to admin_advantages_path
    else
      render :new
    end
  end

  def update
    if @admin_advantage.update(admin_advantage_params)
      flash[:notice] = t('success_create_notice')
      redirect_to admin_advantages_path
    else
      render :edit
    end
  end

  def destroy
    @admin_advantage.destroy
    flash[:notice] = t('success_delete_notice')
    redirect_to admin_advantages_path
  end

  private

  def set_advantage
    @admin_advantage = Advantage.find(params[:id])
  end

  def admin_advantage_params
    params.require(:advantage).permit(Advantage.globalize_attribute_names + [:alias])
  end
end
