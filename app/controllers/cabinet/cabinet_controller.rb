module Cabinet
  class CabinetController < ActionController::Base
    include DeleteCropperImage
    before_action :authenticate_user!
    before_action :check_permission
    before_action :set_locale
    around_action :set_current_user

    layout 'cabinet'

    rescue_from CanCan::AccessDenied do |_exception|
      redirect_to cabinet_root_path
    end

    private

    def check_permission
      redirect_back(fallback_location: root_path) unless current_user.has_any_role?(:questionnaire, :moderator)
    end

    def gis_types
      @gis_types = GisType.all[0..2]
      @balancers = Balancer.all.pluck(:name, :id)
      @infrastructure_types = InfrastructureType.eager_load(:translations).map { |e| [e.name, e.id] }
    end

    def available_states
      except = current_user.moderator? ? [] : %w[published archived]
      @states = Questionnaire.states_with_except(except)
    end

    def set_locale
      I18n.locale = I18n.default_locale
    end

    def set_current_user
      require 'current'
      Current.user = current_user
      yield
    ensure
      Current.user = nil
    end
  end
end
