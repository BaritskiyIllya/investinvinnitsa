class Admin::MenusController < Admin::AdminController
  before_action :set_admin_menu, only: %i[show edit update destroy]
  before_action :parent_menu, only: %i[new create edit update]

  # GET /admin/menus
  # GET /admin/menus.json
  def index
    @admin_menus = Menu.all
  end

  # GET /admin/menus/1
  # GET /admin/menus/1.json
  def show; end

  # GET /admin/menus/new
  def new
    @admin_menu = Menu.new
  end

  # GET /admin/menus/1/edit
  def edit; end

  # POST /admin/menus
  # POST /admin/menus.json
  def create
    @admin_menu = Menu.new(admin_menu_params)
    respond_to do |format|
      if @admin_menu.save
        format.html { redirect_to admin_menus_path, notice: 'Запис успішно створено.' }
        format.json { render :show, status: :created, location: @admin_menu }
      else
        format.html { render :new }
        format.json { render json: @admin_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/menus/1
  # PATCH/PUT /admin/menus/1.json
  def update
    respond_to do |format|
      if @admin_menu.update(admin_menu_params)
        format.html { redirect_to admin_menus_path, notice: 'Запис успішно редаговано.' }
        format.json { render :show, status: :ok, location: @admin_menu }
      else
        format.html { render :edit }
        format.json { render json: @admin_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/menus/1
  # DELETE /admin/menus/1.json
  def destroy
    @admin_menu.destroy
    respond_to do |format|
      format.html { redirect_to admin_menus_path, notice: 'Запис успішно видалено.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_menu
    @admin_menu = Menu.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_menu_params
    params.require(:menu).permit(:position, :link, :menu_group_id, :parent_id, :active, :menu_type,
                                 :title_uk, :title_en,
                                 :tag_alt_uk, :tag_alt_en)
  end

  def parent_menu
    require 'menu_types'
    @parent_menu = Menu.parent_menu.map { |m| [m.title_uk, m.id] }.unshift(['---------', 0])
    @menu_types = MenuTypes.call
  end
end
