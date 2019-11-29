class SectorsController < ApplicationController
  def index
    @sectors = Sector.order(position: :asc)
  end
end
