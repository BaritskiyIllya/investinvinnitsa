class Cabinet::InvestProjectsController < Cabinet::CabinetController
  before_action :set_cabinet_invest_project, only: %i[show edit update destroy]
  before_action :gis_types, only: %i[new create edit update]
  before_action :available_states, only: %i[new create edit update]
  load_and_authorize_resource param_method: :cabinet_invest_project_params

  # include QuestionnaireImages
  include QuestionnaireValidation
  include StateMachine

  # GET /cabinet/invest_projects
  # GET /cabinet/invest_projects.json
  def index
    projects = if current_user.moderator?
                 InvestProject.where.not(state: 0).eager_load(:map_layer)
               else
                 current_user.invest_projects.eager_load(:map_layer).with_translations(I18n.locale)
               end
    @cabinet_invest_projects = projects
  end

  # GET /cabinet/invest_projects/1
  # GET /cabinet/invest_projects/1.json
  def show; end

  # GET /cabinet/invest_projects/new
  def new
    @cabinet_invest_project = current_user.invest_projects.new
  end

  # GET /cabinet/invest_projects/1/edit
  def edit; end

  # POST /cabinet/invest_projects
  # POST /cabinet/invest_projects.json
  def create
    param = cabinet_invest_project_params
    user_balancer = current_user.balancer_id
    param[:balancer_ids] << user_balancer unless param[:balancer_ids].include?(user_balancer.to_s)

    @cabinet_invest_project = current_user.invest_projects.new(param)
    respond_to do |format|
      if @cabinet_invest_project.save
        public_send(params[:invest_project][:status])
        format.html { redirect_to cabinet_invest_projects_path, notice: I18n.t('created') }
        format.json { render :show, status: :created, location: @cabinet_invest_project }
      else
        format.html { render :new }
        format.json { render json: @cabinet_invest_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cabinet/invest_projects/1
  # PATCH/PUT /cabinet/invest_projects/1.json
  def update
    param = cabinet_invest_project_params
    user_balancer = @cabinet_invest_project.user.balancer_id
    param[:balancer_ids] << user_balancer unless param[:balancer_ids].include?(user_balancer.to_s)

    respond_to do |format|
      if @cabinet_invest_project.update(param)
        delete_main_image?(cabinet_invest_project_params[:main_image], @cabinet_invest_project)
        public_send(params[:invest_project][:status])
        format.html { redirect_to cabinet_invest_projects_path, notice: I18n.t('updated') }
        format.json { render :show, status: :ok, location: @cabinet_invest_project }
      else
        format.html { render :edit }
        format.json { render json: @cabinet_invest_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cabinet/invest_projects/1
  # DELETE /cabinet/invest_projects/1.json
  def destroy
    @cabinet_invest_project.destroy
    respond_to do |format|
      format.html { redirect_to cabinet_invest_projects_path, notice: I18n.t('deleted') }
      format.json { head :no_content }
    end
  end

  def instance
    @cabinet_invest_project
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cabinet_invest_project
    @cabinet_invest_project = if current_user.moderator?
                                InvestProject.find(params[:id])
                              else
                                current_user.invest_projects.find(params[:id])
                              end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cabinet_invest_project_params
    permitted = InvestProject.globalize_attribute_names + [:invest_sum, :investment_type_id, :area, :ownership_id,
                                                           :hard_cover_road_distance,
                                                           :highway_distance,
                                                           :railway_distance,
                                                           :airport_distance,
                                                           :gas,
                                                           :electricity,
                                                           :water_supply,
                                                           :main_image,
                                                           :gis_type_name,
                                                           :user_id,
                                                           :state,
                                                           :map_layer_id,
                                                           geo_json_attributes: %i[id geo_type position],
                                                           questionnaire_file_attributes: %i[id fileable_type file
                                                                                             fileable_id _destroy],
                                                           balancer_ids: [], infrastructure_type_ids: []]
    params.require(:invest_project).permit(permitted)
  end
end
