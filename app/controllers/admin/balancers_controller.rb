class Admin::BalancersController < Admin::AdminController
  before_action :set_admin_balancer, only: %i[edit update destroy]

  # GET /admin/balancers
  # GET /admin/balancers.json
  def index
    @admin_balancers = Balancer.all
  end

  # GET /admin/balancers/new
  def new
    @admin_balancer = Balancer.new
  end

  # GET /admin/balancers/1/edit
  def edit; end

  # POST /admin/balancers
  # POST /admin/balancers.json
  def create
    @admin_balancer = Balancer.new(admin_balancer_params)

    respond_to do |format|
      if @admin_balancer.save
        format.html { redirect_to admin_balancers_path, notice: I18n.t('created') }
        format.json { render :show, status: :created, location: @admin_balancer }
      else
        format.html { render :new }
        format.json { render json: @admin_balancer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/balancers/1
  # PATCH/PUT /admin/balancers/1.json
  def update
    respond_to do |format|
      if @admin_balancer.update(admin_balancer_params)
        format.html { redirect_to admin_balancers_path, notice: I18n.t('updated') }
        format.json { render :show, status: :ok, location: @admin_balancer }
      else
        format.html { render :edit }
        format.json { render json: @admin_balancer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/balancers/1
  # DELETE /admin/balancers/1.json
  def destroy
    @admin_balancer.destroy
    respond_to do |format|
      format.html { redirect_to admin_balancers_path, notice: I18n.t('deleted') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_balancer
    @admin_balancer = Balancer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_balancer_params
    params.require(:balancer).permit(:name)
  end
end
