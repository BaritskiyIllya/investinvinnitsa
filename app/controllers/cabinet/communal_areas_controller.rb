class Cabinet::CommunalAreasController < Cabinet::CabinetController
  before_action :gis_types, only: %i[new create edit update]
  before_action :available_states, only: %i[new create edit update]
  before_action :set_cabinet_communal_area, only: %i[show edit update destroy]
  before_action :select_selected_fields, only: %i[new edit create update]
  load_and_authorize_resource

  include QuestionnaireImages
  include QuestionnaireValidation
  include StateMachine

  def index
    areas = CommunalArea.all
    areas = areas.by_status(params[:search_by_status]) if params[:search_by_status].present?
    areas = areas.by_balancer(params[:search_by_balancer]) if params[:search_by_balancer].present?
    areas = areas.by_name(params[:search_by_name]) if params[:search_by_name].present?
    areas = areas.by_map_layer(params[:search_by_map_layer]) if params[:search_by_map_layer].present?
    @cabinet_communal_areas = areas.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show; end

  def new
    @cabinet_communal_area = current_user.communal_areas.new
  end

  def edit; end

  def create
    @cabinet_communal_area = current_user.communal_areas.new(create_params)
    respond_to do |format|
      if status_valid?(create_params[:status]) && @cabinet_communal_area.save
        QuestionnaireImages.build(params, @cabinet_communal_area)
        public_send(params[:communal_area][:status])
        format.html { redirect_to cabinet_communal_areas_path, notice: I18n.t('created') }
        format.json { render :show, status: :created, location: @cabinet_communal_area }
      else
        format.html { render :new }
        format.json { render json: @cabinet_communal_area.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if status_valid?(create_params[:status]) && @cabinet_communal_area.update(create_params)
        QuestionnaireImages.build(params, @cabinet_communal_area)
        delete_main_image?(create_params[:main_image], @cabinet_communal_area)
        @cabinet_communal_area.update(user_id: current_user.id) unless @cabinet_communal_area.user
        public_send(params[:communal_area][:status])
        format.html { redirect_to cabinet_communal_areas_path, notice: I18n.t('updated') }
        format.json { render :show, status: :ok, location: @cabinet_communal_area }
      else
        format.html { render :edit }
        format.json { render json: @cabinet_communal_area.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cabinet_communal_area.destroy
    respond_to do |format|
      format.html { redirect_to cabinet_communal_areas_path, notice: I18n.t('deleted') }
      format.json { head :no_content }
    end
  end

  def instance
    @cabinet_communal_area
  end

  private

  def set_cabinet_communal_area
    @cabinet_communal_area = CommunalArea.find(params[:id])
  end

  def create_params
    permitted = CommunalArea.globalize_attribute_names + [:house_number, :prop_registration, :cadastral_number, :area,
                                                          :rate_percent, :year_tax, :operation_year, :level,
                                                          :tech_area, :build_year, :architectural, :land_category_id,
                                                          :balance_holder_id, :communal_branch_id, :map_layer_id,
                                                          :main_image, :gis_type_name, :user_id, :status, :site,
                                                          questionnaire_images_attributes: %i[id imgable_type
                                                                                              imgable_id _destroy],
                                                          questionnaire_file_attributes: %i[id fileable_type file
                                                                                            fileable_id _destroy],
                                                          geo_json_attributes: %i[id geo_type position],
                                                          balancer_ids: []]
    params.require(:communal_area).permit(permitted)
  end

  def select_selected_fields
    @land_categories = LandCategory.all.map { |e| [e.name, e.id] }
    @communal_branchs = CommunalBranch.all.map { |e| [e.name, e.id] }
    @balance_holders = BalanceHolder.all.map { |e| [e.name, e.id] }
  end
end
