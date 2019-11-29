class OfficeAreasController < ApplicationController
  def show
    @area = OfficeArea.find_by(id: params[:id])
  end
end
