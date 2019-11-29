class MaterialsController < ApplicationController
  before_action :set_materials, only: %i[show]

  def index
    @materials = Material.all
  end

  def show
    if @material
      @file = @material.file_by_locale(locale)
      @image = @material.image_by_locale(locale)
      render :show
    elsif @block_material
      @material = @block_material
      render :show_block_material
    else
      not_found
    end
  end

  private

  def set_materials
    @material = Material.find_by(link: params[:id])
    @block_material = BlockMaterial.find_by(link: params[:id])
  end
end
