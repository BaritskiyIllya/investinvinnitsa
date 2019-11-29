class Cabinet::PotentialInvestorsController < Cabinet::CabinetController
  before_action :set_cabinet_potential_investor, only: %i[show destroy]
  load_resource only: %i[index show]

  # GET /cabinet/potential_investors
  # GET /cabinet/potential_investors.json
  def index
    @cabinet_potential_investors = PotentialInvestor.all.page(params[:page]).per(10)
  end

  # GET /cabinet/potential_investors/1
  # GET /cabinet/potential_investors/1.json
  def show; end

  # DELETE /cabinet/potential_investors/1
  # DELETE /cabinet/potential_investors/1.json
  def destroy
    @cabinet_potential_investor.destroy
    respond_to do |format|
      format.html { redirect_to cabinet_potential_investors_url, notice: 'Object was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cabinet_potential_investor
    @cabinet_potential_investor = PotentialInvestor.find(params[:id])
  end
end
