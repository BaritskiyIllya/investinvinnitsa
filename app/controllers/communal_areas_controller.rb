class CommunalAreasController < ApplicationController
  def show
    @area = CommunalArea.find_by(id: params[:id])
  end
end
