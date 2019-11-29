class TeamsController < ApplicationController
  def index
    @team_content = Content.find_by(alias: 'our_team')
    @teams = Team.order(:trim)
    # @departments = Department.order(:position)
  end
end
