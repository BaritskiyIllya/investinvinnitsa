class Cabinet::InfrastructureTypesController < Cabinet::CabinetController
  before_action :set_cabinet_infrastructure_type, only: %i[edit update]
  load_and_authorize_resource param_method: :cabinet_infrastructure_type_params

  # GET /cabinet/infrastructure_types
  # GET /cabinet/infrastructure_types.json
  def index
    @cabinet_infrastructure_types = InfrastructureType.all
  end

  # GET /cabinet/infrastructure_types/new
  def new
    @cabinet_infrastructure_type = InfrastructureType.new
  end

  # GET /cabinet/infrastructure_types/1/edit
  def edit; end

  # POST /cabinet/infrastructure_types
  # POST /cabinet/infrastructure_types.json
  def create
    @cabinet_infrastructure_type = InfrastructureType.new(cabinet_infrastructure_type_params)

    respond_to do |format|
      if @cabinet_infrastructure_type.save
        format.html { redirect_to cabinet_infrastructure_types_path, notice: I18n.t('created') }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /cabinet/infrastructure_types/1
  # PATCH/PUT /cabinet/infrastructure_types/1.json
  def update
    respond_to do |format|
      if @cabinet_infrastructure_type.update(cabinet_infrastructure_type_params)
        format.html { redirect_to cabinet_infrastructure_types_path, notice: I18n.t('updated') }
      else
        format.html { render :edit }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cabinet_infrastructure_type
    @cabinet_infrastructure_type = InfrastructureType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cabinet_infrastructure_type_params
    params.require(:infrastructure_type).permit(InfrastructureType.globalize_attribute_names)
  end
end
