class Admin::PotentialInvestorsController < Admin::AdminController
  before_action :set_admin_potential_investor, only: %i[show destroy]
  load_resource only: %i[index show]

  # GET /admin/potential_investors
  # GET /admin/potential_investors.json
  def index
    @admin_potential_investors = PotentialInvestor.all.page(params[:page]).per(10)
  end

  # GET /admin/potential_investors/1
  # GET /admin/potential_investors/1.json
  def show; end

  # DELETE /admin/potential_investors/1
  # DELETE /admin/potential_investors/1.json
  def destroy
    @admin_potential_investor.destroy
    respond_to do |format|
      format.html { redirect_to admin_potential_investors_url, notice: 'Object was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_potential_investor
    @admin_potential_investor = PotentialInvestor.find(params[:id])
  end
end
