class Questionnaire < ApplicationRecord
  self.abstract_class = true
  include AreaDependencies
  include StateMachines::GisQuestionnaire

  def avalible_moderate?
    draft? || unverified?
  end

  scope :for_invest_map, -> {
                           joins(:geo_json, :map_layer)
                             .where.not('geo_json.position' => '')
                             .where('map_layers.layer' => false).published
                         }
  scope :not_layer, -> { joins(:map_layer).where('map_layers.layer' => false) }

  def ownership_name
    ownership.try :name
  end
end
