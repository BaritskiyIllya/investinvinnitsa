class LandmarksController < ApplicationController
  def index
    @landmarks = Landmark.order(position: :asc).page(params[:page]).per(4)
    respond_to :js
  end
end
