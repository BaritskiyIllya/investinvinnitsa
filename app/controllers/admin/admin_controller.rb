class Admin::AdminController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_permition
  layout 'admin'

  private

  def check_permition
    redirect_back(fallback_location: root_path) unless current_user.has_any_role?(:admin)
  end
end
