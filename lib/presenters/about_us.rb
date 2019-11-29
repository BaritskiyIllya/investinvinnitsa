# frozen_string_literal: true

module Presenters
  class AboutUs
    attr_reader :comfortable_city, :personnel_potential, :business_partner, :investment_climate, :international_airport,
                :railway_junction, :public_transport, :cycling_tracks, :budget_opportunities, :serhii_morhunov
    def initialize
      @comfortable_city = About.find_by(alias: 'comfortable_city')
      @personnel_potential = About.find_by(alias: 'personnel_potential')
      @business_partner = About.find_by(alias: 'business_partner')
      @investment_climate = About.find_by(alias: 'investment_climate')
      @international_airport = About.find_by(alias: 'international_airport')
      @railway_junction = About.find_by(alias: 'railway_junction')
      @public_transport = About.find_by(alias: 'public_transport')
      @cycling_tracks = About.find_by(alias: 'cycling_tracks')
      @budget_opportunities = About.find_by(alias: 'budget_opportunities')
      @serhii_morhunov = About.find_by(alias: 'serhii_morhunov')
    end
  end
end
