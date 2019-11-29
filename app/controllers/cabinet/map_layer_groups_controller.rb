class Cabinet::MapLayerGroupsController < Cabinet::CabinetController
  load_and_authorize_resource
  before_action :set_cabinet_map_layer_group, only: %i[show edit update]

  def index
    @cabinet_map_layer_groups = MapLayerGroup.all
  end

  def show; end

  def new
    @cabinet_map_layer_group = MapLayerGroup.new
  end

  def edit; end

  def create
    @cabinet_map_layer_group = MapLayerGroup.new(create_params)

    respond_to do |format|
      if @cabinet_map_layer_group.save
        format.html { redirect_to cabinet_map_layer_groups_path, notice: I18n.t('created') }
        format.json { render :show, status: :created, location: @cabinet_map_layer_group }
      else
        format.html { render :new }
        format.json { render json: @cabinet_map_layer_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cabinet_map_layer_group.update(create_params)
        format.html { redirect_to cabinet_map_layer_groups_path, notice: I18n.t('updated') }
        format.json { render :show, status: :ok, location: @cabinet_map_layer_group }
      else
        format.html { render :edit }
        format.json { render json: @cabinet_map_layer_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cabinet_map_layer_group.destroy
    respond_to do |format|
      format.html { redirect_to cabinet_map_layer_groups_path, notice: I18n.t('deleted') }
      format.json { head :no_content }
    end
  end

  private

  def set_cabinet_map_layer_group
    @cabinet_map_layer_group = MapLayerGroup.find(params[:id])
  end

  def create_params
    params.require(:map_layer_group).permit(:title_uk, :title_en, :alias)
  end
end
