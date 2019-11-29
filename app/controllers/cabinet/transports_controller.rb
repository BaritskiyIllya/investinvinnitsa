class Cabinet::TransportsController < Cabinet::CabinetController
  before_action :set_cabinet_transport, only: %i[edit update destroy]
  before_action :gis_types, only: %i[new create edit update]
  before_action :available_states, only: %i[new create edit update]
  load_and_authorize_resource param_method: :cabinet_transport_params

  include QuestionnaireValidation
  include StateMachine

  # GET /cabinet/transports
  # GET /cabinet/transports.json
  def index
    @cabinet_transports = Transport.eager_load(:map_layer)
  end

  # GET /cabinet/transports/1
  # GET /cabinet/transports/1.json
  # def show
  # end

  # GET /cabinet/transports/new
  def new
    @cabinet_transport = current_user.transports.new
  end

  # GET /cabinet/transports/1/edit
  def edit; end

  # POST /cabinet/transports
  # POST /cabinet/transports.json
  def create
    @cabinet_transport = current_user.transports.new(cabinet_transport_params)
    respond_to do |format|
      if @cabinet_transport.save
        public_send(params[:transport][:status])
        format.html { redirect_to cabinet_transports_path, notice: I18n.t('created') }
      else
        format.html { render :new }
        format.json { render json: @cabinet_transport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cabinet/transports/1
  # PATCH/PUT /cabinet/transports/1.json
  def update
    respond_to do |format|
      if @cabinet_transport.update(cabinet_transport_params)
        public_send(params[:transport][:status])
        format.html { redirect_to cabinet_transports_path, notice: I18n.t('updated') }
      else
        format.html { render :edit }
        format.json { render json: @cabinet_transport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cabinet/transports/1
  # DELETE /cabinet/transports/1.json
  def destroy
    @cabinet_transport.destroy
    respond_to do |format|
      format.html { redirect_to cabinet_transports_path, notice: I18n.t('deleted') }
      format.json { head :no_content }
    end
  end

  def instance
    @cabinet_transport
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cabinet_transport
    @cabinet_transport = Transport.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cabinet_transport_params
    permitted = Transport.globalize_attribute_names + [
      :gis_type_name,
      :status,
      :map_layer_id,
      :transport_type_id,
      geo_json_attributes: %i[id geo_type position]
    ]
    params.require(:transport).permit(permitted)
  end

  def gis_types
    @gis_types = GisType.where(name: 'LineString')
  end
end
