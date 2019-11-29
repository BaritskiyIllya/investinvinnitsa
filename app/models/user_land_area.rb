class UserLandArea < ApplicationRecord
  def decimal_fields
    %w[total_area state_road_distance railway_distance airport_distance]
  end
end
