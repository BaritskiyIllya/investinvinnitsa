class Cabinet::LandAreasController < Cabinet::CabinetController
  before_action :set_cabinet_land_area, only: %i[show edit update destroy]
  before_action :gis_types, only: %i[new create edit update]
  before_action :available_states, only: %i[new create edit update]
  load_and_authorize_resource param_method: :land_area_params

  include QuestionnaireImages
  include QuestionnaireValidation
  include StateMachine
  # GET /cabinet/land_areas
  # GET /cabinet/land_areas.json
  def index
    areas = if current_user.moderator?
              LandArea.where.not(state: 0).eager_load(:map_layer)
            else
              current_user.land_areas.eager_load(:map_layer).with_translations(I18n.locale)
            end
    @cabinet_land_areas = areas
  end

  # GET /cabinet/land_areas/1
  # GET /cabinet/land_areas/1.json
  def show; end

  # GET /cabinet/land_areas/new
  def new
    @cabinet_land_area = current_user.land_areas.new
  end

  # GET /cabinet/land_areas/1/edit
  def edit; end

  # POST /cabinet/land_areas
  # POST /cabinet/land_areas.json
  def create
    param = land_area_params
    user_balancer = current_user.balancer_id
    param[:balancer_ids] << user_balancer unless param[:balancer_ids].include?(user_balancer.to_s)

    @cabinet_land_area = current_user.land_areas.new(param)
    respond_to do |format|
      if status_valid?(land_area_params[:status]) && @cabinet_land_area.save
        QuestionnaireImages.build(params, @cabinet_land_area)
        public_send(params[:land_area][:status])
        format.html { redirect_to cabinet_land_areas_path, notice: I18n.t('created') }
        format.json { render :show, status: :created, location: @cabinet_land_area }
      else
        format.html { render :new }
        format.json { render json: @cabinet_land_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cabinet/land_areas/1
  # PATCH/PUT /cabinet/land_areas/1.json
  def update
    param = land_area_params
    user_balancer = @cabinet_land_area.user.balancer_id
    param[:balancer_ids] << user_balancer unless param[:balancer_ids].include?(user_balancer.to_s)

    respond_to do |format|
      if status_valid?(land_area_params[:status]) && @cabinet_land_area.update(param)
        QuestionnaireImages.build(params, @cabinet_land_area)
        delete_main_image?(land_area_params[:main_image], @cabinet_land_area)
        public_send(params[:land_area][:status])
        format.html { redirect_to cabinet_land_areas_path, notice: I18n.t('updated') }
        format.json { render :show, status: :ok, location: @cabinet_land_area }
      else
        format.html { render :edit }
        format.json { render json: @cabinet_land_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cabinet/land_areas/1
  # DELETE /cabinet/land_areas/1.json
  def destroy
    @cabinet_land_area.destroy
    respond_to do |format|
      format.html { redirect_to cabinet_land_areas_path, notice: I18n.t('deleted') }
      format.json { head :no_content }
    end
  end

  def instance
    @cabinet_land_area
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cabinet_land_area
    @cabinet_land_area = if current_user.moderator?
                           LandArea.find(params[:id])
                         else
                           current_user.land_areas.find(params[:id])
                         end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def land_area_params
    permitted = LandArea.globalize_attribute_names + [:area_type, :total_area, :underground_engin, :overhead_engin,
                                                      :cadastral_number, :rent, :sale, :state_road_distance,
                                                      :railway_distance, :airport_distance, :phone, :email, :main_image,
                                                      :gis_type_name, :status, :map_layer_id, :ownership_id,
                                                      questionnaire_images_attributes: %i[id imgable_type
                                                                                          imgable_id _destroy],
                                                      questionnaire_file_attributes: %i[id fileable_type file
                                                                                        fileable_id _destroy],
                                                      geo_json_attributes: %i[id geo_type position],
                                                      balancer_ids: [], infrastructure_type_ids: []]
    params.require(:land_area).permit(permitted)
  end
end
