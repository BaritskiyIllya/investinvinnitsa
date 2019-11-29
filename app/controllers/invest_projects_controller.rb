class InvestProjectsController < ApplicationController
  def show
    @area = InvestProject.find_by(id: params[:id])
  end
end
