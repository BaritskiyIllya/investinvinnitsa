class Transport < Questionnaire
  translates :name, :route, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[name route]

  belongs_to :transport_type
end
