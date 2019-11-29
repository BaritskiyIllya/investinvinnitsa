class InvestMapsController < ApplicationController
  def index
    @filter_groups = MapLayerGroup.eager_load(:translations).includes(:map_layers).order(:created_at)
    @projects = Project.all
  end

  def select_object_info
    @gis = gis_params[:model].constantize.find_by(id: gis_params[:id])
  end

  private

  def gis_params
    params.require(:gis).permit(:id, :model)
  end
end
