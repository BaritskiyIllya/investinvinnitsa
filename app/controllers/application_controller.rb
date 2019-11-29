# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale, except: :geo_json_gis
  before_action :menu

  def not_found
    render file: Rails.root.join('public', '404.html'), status: :not_found, layout: false
  end

  private

  def set_locale
    I18n.locale = params[:locale].blank? ? :uk : :en
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  def menu
    require 'menu_list'
    # @main_menu = Rails.cache.fetch('menu_' + I18n.locale.to_s, expires_in: 5.minutes) do
    #   MenuList.build_top_bar
    # end
    @main_menu = MenuList.build_top_bar
  end
end
