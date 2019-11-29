class Cabinet::BalancersController < Cabinet::CabinetController
  load_and_authorize_resource
  before_action :set_cabinet_balancer, only: %i[edit update destroy]

  # GET /cabinet/balancers
  # GET /cabinet/balancers.json
  def index
    @cabinet_balancers = Balancer.all
  end

  # GET /cabinet/balancers/new
  def new
    @cabinet_balancer = Balancer.new
  end

  # GET /cabinet/balancers/1/edit
  def edit; end

  # POST /cabinet/balancers
  # POST /cabinet/balancers.json
  def create
    @cabinet_balancer = Balancer.new(create_params)

    respond_to do |format|
      if @cabinet_balancer.save
        format.html { redirect_to cabinet_balancers_path, notice: I18n.t('created') }
        format.json { render :show, status: :created, location: @cabinet_balancer }
      else
        format.html { render :new }
        format.json { render json: @cabinet_balancer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cabinet/balancers/1
  # PATCH/PUT /cabinet/balancers/1.json
  def update
    respond_to do |format|
      if @cabinet_balancer.update(create_params)
        format.html { redirect_to cabinet_balancers_path, notice: I18n.t('updated') }
        format.json { render :show, status: :ok, location: @cabinet_balancer }
      else
        format.html { render :edit }
        format.json { render json: @cabinet_balancer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cabinet/balancers/1
  # DELETE /cabinet/balancers/1.json
  def destroy
    @cabinet_balancer.destroy
    respond_to do |format|
      format.html { redirect_to cabinet_balancers_path, notice: I18n.t('deleted') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cabinet_balancer
    @cabinet_balancer = Balancer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def create_params
    params.require(:balancer).permit(:name)
  end
end
