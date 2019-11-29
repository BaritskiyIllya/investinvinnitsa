class Admin::BlockMaterialsController < Admin::AdminController
  before_action :set_admin_block_material, only: %i[show edit update destroy]

  # GET /admin/block_materials
  # GET /admin/block_materials.json
  def index
    @admin_block_materials = BlockMaterial.all.page(params[:page])
  end

  # GET /admin/block_materials/1
  # GET /admin/block_materials/1.json
  def show; end

  # GET /admin/block_materials/new
  def new
    @admin_block_material = BlockMaterial.new
  end

  # GET /admin/block_materials/1/edit
  def edit; end

  # POST /admin/block_materials
  # POST /admin/block_materials.json
  def create
    @admin_block_material = BlockMaterial.new(admin_block_material_params)

    respond_to do |format|
      if @admin_block_material.save
        format.html { redirect_to admin_block_materials_path, notice: I18n.t('created') }
        format.json { render :show, status: :created, location: @admin_block_material }
      else
        format.html { render :new }
        format.json { render json: @admin_block_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/block_materials/1
  # PATCH/PUT /admin/block_materials/1.json
  def update
    respond_to do |format|
      if @admin_block_material.update(admin_block_material_params)
        format.html { redirect_to admin_block_materials_path, notice: I18n.t('updated') }
        format.json { render :show, status: :ok, location: @admin_block_material }
      else
        format.html { render :edit }
        format.json { render json: @admin_block_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/block_materials/1
  # DELETE /admin/block_materials/1.json
  def destroy
    @admin_block_material.destroy
    respond_to do |format|
      format.html { redirect_to admin_block_materials_path, notice: I18n.t('deleted') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_block_material
    @admin_block_material = BlockMaterial.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_block_material_params
    params.require(:block_material).permit(:link,
                                           block_material_contents_attributes: [:id,
                                                                                :title_uk,
                                                                                :title_en,
                                                                                :description_uk,
                                                                                :description_en,
                                                                                :image,
                                                                                :position,
                                                                                :_destroy,
                                                                                material_content_columns_attributes: %i[
                                                                                  id
                                                                                  color
                                                                                  title_uk
                                                                                  title_en
                                                                                  value_uk
                                                                                  value_en
                                                                                  _destroy
                                                                                ]])
  end
end
