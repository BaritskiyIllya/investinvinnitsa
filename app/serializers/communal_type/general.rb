module CommunalType
  class General
    def initialize(object)
      @object = object
    end

    def pop_up
      {
        name: { value: @object.object_name, title: I18n.t('communal_area.object_name') },
        type: { value: @object.object_type, title: I18n.t('communal_area.object_type') },
        address: { value: @object.address, title: I18n.t('communal_area.address') },
        tech_area: { value: @object.tech_area, title: I18n.t('communal_area.tech_area') }
      }
    end
  end
end
