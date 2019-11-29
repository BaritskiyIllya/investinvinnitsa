class Admin::TeamsController < Admin::AdminController
  include DeleteCropperImage

  before_action :set_admin_team, only: %w[show edit update destroy]

  def index
    @admin_teams = Team.order(:trim)
  end

  def show; end

  def new
    @admin_team = Team.new
  end

  def edit; end

  def create
    @admin_team = Team.new(admin_team_params)
    if @admin_team.save
      flash[:notice] = t('success_create_notice')
      redirect_to admin_teams_path
    else
      render :new
    end
  end

  def update
    delete_image?(params[:team][:image], @admin_team)
    if @admin_team.update(admin_team_params)
      flash[:notice] = t('success_create_notice')
      redirect_to admin_teams_path
    else
      render :edit
    end
  end

  def destroy
    @admin_team.destroy
    flash[:notice] = t('success_delete_notice')
    redirect_to admin_teams_path
  end

  private

  def set_admin_team
    @admin_team = Team.find(params[:id])
  end

  def admin_team_params
    params.require(:team).permit(Team.globalize_attribute_names + %i[phone email facebook linkedin department_id image
                                                                     on_main trim])
  end
end
