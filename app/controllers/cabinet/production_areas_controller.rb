class Cabinet::ProductionAreasController < Cabinet::CabinetController
  before_action :set_cabinet_production_area, only: %i[show edit update destroy]
  before_action :gis_types, only: %i[new create edit update]
  before_action :available_states, only: %i[new create edit update]
  load_and_authorize_resource param_method: :area_params

  include QuestionnaireImages
  include QuestionnaireValidation
  include StateMachine

  # GET /cabinet/production_areas
  # GET /cabinet/production_areas.json
  def index
    areas = if current_user.moderator?
              ProductionArea.where.not(state: 0).eager_load(:map_layer)
            else
              current_user.production_areas.eager_load(:map_layer).with_translations(I18n.locale)
            end
    @cabinet_production_areas = areas
  end

  # GET /cabinet/production_areas/1
  # GET /cabinet/production_areas/1.json
  def show; end

  # GET /cabinet/production_areas/new
  def new
    @cabinet_production_area = current_user.production_areas.new
  end

  # GET /cabinet/production_areas/1/edit
  def edit; end

  # POST /cabinet/production_areas
  # POST /cabinet/production_areas.json
  def create
    param = area_params
    user_balancer = current_user.balancer_id
    param[:balancer_ids] << user_balancer unless param[:balancer_ids].include?(user_balancer.to_s)

    @cabinet_production_area = current_user.production_areas.new(param)
    respond_to do |format|
      if status_valid?(area_params[:status]) && @cabinet_production_area.save
        QuestionnaireImages.build(params, @cabinet_production_area)
        public_send(params[:production_area][:status])
        format.html { redirect_to cabinet_production_areas_path, notice: 'Запис успішно створено.' }
        format.json { render :show, status: :created, location: @cabinet_production_area }
      else
        format.html { render :new }
        format.json { render json: @cabinet_production_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cabinet/production_areas/1
  # PATCH/PUT /cabinet/production_areas/1.json
  def update
    param = area_params
    user_balancer = @cabinet_production_area.user.balancer_id
    param[:balancer_ids] << user_balancer unless param[:balancer_ids].include?(user_balancer.to_s)

    respond_to do |format|
      if status_valid?(area_params[:status]) && @cabinet_production_area.update(param)
        QuestionnaireImages.build(params, @cabinet_production_area)
        delete_main_image?(area_params[:main_image], @cabinet_production_area)
        public_send(params[:production_area][:status])
        format.html { redirect_to cabinet_production_areas_path, notice: 'Запис успішно оновлено.' }
        format.json { render :show, status: :ok, location: @cabinet_production_area }
      else
        format.html { render :edit }
        format.json { render json: @cabinet_production_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cabinet/production_areas/1
  # DELETE /cabinet/production_areas/1.json
  def destroy
    @cabinet_production_area.destroy
    respond_to do |format|
      format.html { redirect_to cabinet_production_areas_path, notice: 'Запис успішно видалено.' }
      format.json { head :no_content }
    end
  end

  def instance
    @cabinet_production_area
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cabinet_production_area
    @cabinet_production_area = if current_user.moderator?
                                 ProductionArea.find(params[:id])
                               else
                                 current_user.production_areas.find(params[:id])
                               end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def area_params
    permitted = ProductionArea.globalize_attribute_names + [:edrpou_code, :site, :railway_track, :railway_distance,
                                                            :trucks_road, :state_road_distance, :airport_distance,
                                                            :total_area, :building_year, :free_floors_count,
                                                            :free_floors, :production_area, :additional, :phone,
                                                            :email, :rent_year, :sale, :date_info, :main_image,
                                                            :gis_type_name, :status, :map_layer_id, :ownership_id,
                                                            questionnaire_images_attributes: %i[id imgable_type
                                                                                                imgable_id _destroy],
                                                            questionnaire_file_attributes: %i[id fileable_type file
                                                                                              fileable_id _destroy],
                                                            geo_json_attributes: %i[id geo_type position],
                                                            balancer_ids: [], infrastructure_type_ids: []]
    params.require(:production_area).permit(permitted)
  end
end
