class Cabinet::UsersController < Cabinet::CabinetController
  before_action :set_cabinet_user, only: %i[edit update]
  before_action :variables, only: %i[edit update]
  before_action :check_weight, only: %i[edit update]
  load_and_authorize_resource params_method: :cabinet_user_params

  def index
    @cabinet_users = User.all
  end

  def edit; end

  def update
    respond_to do |format|
      if @cabinet_user.update(cabinet_user_params)
        format.html { redirect_to cabinet_users_path, notice: I18n.t('updated') }
      else
        format.html { render :edit }
        format.json { render json: @cabinet_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_cabinet_user
    @cabinet_user = User.find(params[:id])
  end

  def cabinet_user_params
    params.require(:user).permit(:roles_mask, :blocked,
                                 balancer_relation_attributes: %i[id
                                                                  balanceable_id
                                                                  balanceable_type
                                                                  balancer_id
                                                                  _destroy])
  end

  def variables
    @user_roles = User.roles_array_for_moder.pluck(:value, :key)
    @balancers = Balancer.pluck(:name, :id)
  end

  def check_weight
    require 'user_weight'
    @cabinet_user = User.find(params[:id])
    redirect_to root_path unless UserWeight.check(@cabinet_user, current_user)
  end
end
