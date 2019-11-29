class Cabinet::OwnershipsController < Cabinet::CabinetController
  before_action :set_cabinet_ownership, only: %i[edit update]
  load_and_authorize_resource param_method: :cabinet_ownership_params

  # GET /cabinet/ownerships
  # GET /cabinet/ownerships.json
  def index
    @cabinet_ownerships = Ownership.all
  end

  # GET /cabinet/ownerships/new
  def new
    @cabinet_ownership = Ownership.new
  end

  # GET /cabinet/ownerships/1/edit
  def edit; end

  # POST /cabinet/ownerships
  # POST /cabinet/ownerships.json
  def create
    @cabinet_ownership = Ownership.new(cabinet_ownership_params)

    respond_to do |format|
      if @cabinet_ownership.save
        format.html { redirect_to cabinet_ownerships_path, notice: I18n.t('created') }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /cabinet/ownerships/1
  # PATCH/PUT /cabinet/ownerships/1.json
  def update
    respond_to do |format|
      if @cabinet_ownership.update(cabinet_ownership_params)
        format.html { redirect_to cabinet_ownerships_path, notice: I18n.t('updated') }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /cabinet/ownerships/1
  # DELETE /cabinet/ownerships/1.json
  # def destroy
  #   @cabinet_ownership.destroy
  #   respond_to do |format|
  #     format.html { redirect_to cabinet_ownerships_path, notice: 'Ownership was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cabinet_ownership
    @cabinet_ownership = Ownership.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cabinet_ownership_params
    params.require(:ownership).permit(Ownership.globalize_attribute_names)
  end
end
