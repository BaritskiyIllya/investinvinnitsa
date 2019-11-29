class ProductionAreasController < ApplicationController
  def show
    @area = ProductionArea.find_by(id: params[:id])
  end
end
