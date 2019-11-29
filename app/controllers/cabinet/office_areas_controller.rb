class Cabinet::OfficeAreasController < Cabinet::CabinetController
  before_action :set_cabinet_office_area, only: %i[show edit update destroy]
  before_action :gis_types, only: %i[new create edit update]
  before_action :available_states, only: %i[new create edit update]
  load_and_authorize_resource param_method: :office_area_params

  include QuestionnaireImages
  include QuestionnaireValidation
  include StateMachine
  # GET /cabinet/office_areas
  # GET /cabinet/office_areas.json
  def index
    areas = if current_user.moderator?
              OfficeArea.where.not(state: 0).eager_load(:map_layer)
            else
              current_user.office_areas.eager_load(:map_layer).with_translations(I18n.locale)
            end
    @cabinet_office_areas = areas
  end

  # GET /cabinet/office_areas/1
  # GET /cabinet/office_areas/1.json
  def show; end

  # GET /cabinet/office_areas/new
  def new
    @cabinet_office_area = current_user.office_areas.new
  end

  # GET /cabinet/office_areas/1/edit
  def edit; end

  # POST /cabinet/office_areas
  # POST /cabinet/office_areas.json
  def create
    param = office_area_params
    user_balancer = current_user.balancer_id
    param[:balancer_ids] << user_balancer unless param[:balancer_ids].include?(user_balancer.to_s)

    @cabinet_office_area = current_user.office_areas.new(param)
    respond_to do |format|
      if status_valid?(office_area_params[:status]) && @cabinet_office_area.save
        QuestionnaireImages.build(params, @cabinet_office_area)
        public_send(params[:office_area][:status])
        format.html { redirect_to cabinet_office_areas_path, notice: I18n.t('created') }
        format.json { render :show, status: :created, location: @cabinet_office_area }
      else
        format.html { render :new }
        format.json { render json: @cabinet_office_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cabinet/office_areas/1
  # PATCH/PUT /cabinet/office_areas/1.json
  def update
    param = office_area_params
    user_balancer = @cabinet_office_area.user.balancer_id
    param[:balancer_ids] << user_balancer unless param[:balancer_ids].include?(user_balancer.to_s)

    respond_to do |format|
      if status_valid?(office_area_params[:status]) && @cabinet_office_area.update(param)
        QuestionnaireImages.build(params, @cabinet_office_area)
        delete_main_image?(office_area_params[:main_image], @cabinet_office_area)
        public_send(params[:office_area][:status])
        format.html { redirect_to cabinet_office_areas_path, notice: I18n.t('updated') }
        format.json { render :show, status: :ok, location: @cabinet_office_area }
      else
        format.html { render :edit }
        format.json { render json: @cabinet_office_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cabinet/office_areas/1
  # DELETE /cabinet/office_areas/1.json
  def destroy
    @cabinet_office_area.destroy
    respond_to do |format|
      format.html { redirect_to cabinet_office_areas_path, notice: I18n.t('deleted') }
      format.json { head :no_content }
    end
  end

  def instance
    @cabinet_office_area
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cabinet_office_area
    @cabinet_office_area = if current_user.moderator?
                             OfficeArea.find(params[:id])
                           else
                             current_user.office_areas.find(params[:id])
                           end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def office_area_params
    permitted = OfficeArea.globalize_attribute_names + [:edrpou_code, :site, :total_area, :electricity_cost,
                                                        :gas_cost, :drainager_cost, :heat_cost, :city_center_distance,
                                                        :water_cost, :transport_stop_distance, :phone, :email, :rent,
                                                        :sale, :date_info, :main_image, :gis_type_name, :status,
                                                        :map_layer_id,
                                                        questionnaire_images_attributes: %i[id imgable_type
                                                                                            imgable_id _destroy],
                                                        questionnaire_file_attributes: %i[id fileable_type file
                                                                                          fileable_id _destroy],
                                                        geo_json_attributes: %i[id geo_type position], balancer_ids: [],
                                                        infrastructure_type_ids: []]
    params.require(:office_area).permit(permitted)
  end
end
