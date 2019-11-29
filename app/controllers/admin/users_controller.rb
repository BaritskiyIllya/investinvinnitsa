class Admin::UsersController < Admin::AdminController
  before_action :set_admin_user, only: %i[edit update]
  before_action :variables, only: %i[edit update]
  before_action :check_weight, only: %i[edit update]

  def index
    @admin_users = User.all
  end

  def edit; end

  def update
    respond_to do |format|
      if @admin_user.update(admin_user_params)
        format.html { redirect_to admin_users_path, notice: 'Запис успішно оновлено.' }
      else
        format.html { render :edit }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_admin_user
    @admin_user = User.find(params[:id])
  end

  def admin_user_params
    params.require(:user).permit(:roles_mask, :blocked,
                                 balancer_relation_attributes: %i[id
                                                                  balanceable_id
                                                                  balanceable_type
                                                                  balancer_id
                                                                  _destroy])
  end

  def variables
    @user_roles = User.user_roles.pluck(:value, :key)
    @balancers = Balancer.pluck(:name, :id)
  end

  def check_weight
    require 'user_weight'
    @admin_user = User.find(params[:id])
    redirect_to root_path unless UserWeight.check(@admin_user, current_user)
  end
end
