class LandAreasController < ApplicationController
  def show
    @area = LandArea.find_by(id: params[:id])
  end
end
