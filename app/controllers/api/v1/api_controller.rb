class Api::V1::ApiController < ActionController::API
  before_action :set_locale

  private

  def set_locale
    I18n.locale = params[:locale].blank? || params[:locale].eql?('uk') ? :uk : :en
  end
end
