class PotentialInvestor < ApplicationRecord
  has_one :representative
  accepts_nested_attributes_for :representative, reject_if: ->(c) { c[:name].blank? }

  def decimal_fields
    %w[budget land_area area project_cost]
  end
end
