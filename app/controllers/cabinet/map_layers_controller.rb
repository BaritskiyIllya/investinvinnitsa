class Cabinet::MapLayersController < Cabinet::CabinetController
  load_and_authorize_resource
  before_action :set_cabinet_map_layer, only: %i[show edit update destroy]

  # GET /cabinet/map_layers
  # GET /cabinet/map_layers.json
  def index
    @cabinet_map_layers = MapLayer.all.order(position: :asc)
  end

  # GET /cabinet/map_layers/1
  # GET /cabinet/map_layers/1.json
  def show; end

  # GET /cabinet/map_layers/new
  def new
    @cabinet_map_layer = MapLayer.new
  end

  # GET /cabinet/map_layers/1/edit
  def edit; end

  # POST /cabinet/map_layers
  # POST /cabinet/map_layers.json
  def create
    @cabinet_map_layer = MapLayer.new(create_params)

    respond_to do |format|
      if @cabinet_map_layer.save
        format.html { redirect_to cabinet_map_layers_path, notice: I18n.t('created') }
        format.json { render :show, status: :created, location: @cabinet_map_layer }
      else
        format.html { render :new }
        format.json { render json: @cabinet_map_layer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cabinet/map_layers/1
  # PATCH/PUT /cabinet/map_layers/1.json
  def update
    respond_to do |format|
      if @cabinet_map_layer.update(create_params)
        format.html { redirect_to cabinet_map_layers_path, notice: I18n.t('updated') }
        format.json { render :show, status: :ok, location: @cabinet_map_layer }
      else
        format.html { render :edit }
        format.json { render json: @cabinet_map_layer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cabinet/map_layers/1
  # DELETE /cabinet/map_layers/1.json
  def destroy
    @cabinet_map_layer.destroy
    respond_to do |format|
      format.html { redirect_to cabinet_map_layers_path, notice: I18n.t('deleted') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cabinet_map_layer
    @cabinet_map_layer = MapLayer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def create_params
    params.require(:map_layer).permit(:title_uk,
                                      :title_en,
                                      :active,
                                      :layer,
                                      :position,
                                      :icon,
                                      :map_layer_group_id,
                                      map_layer_link_attributes: %i[id link info _destroy])
  end
end
