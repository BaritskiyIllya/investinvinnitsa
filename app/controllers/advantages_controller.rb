class AdvantagesController < ApplicationController
  before_action :set_advantage, only: %w[show]

  def show; end

  private

  def set_advantage
    @advantage = Advantage.find(params[:id])
  end
end
