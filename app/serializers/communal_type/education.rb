module CommunalType
  class Education
    def initialize(object)
      @object = object
    end

    def pop_up
      {
        name: { value: @object.object_name, title: I18n.t('communal_area.education_object_name') },
        address: { value: @object.address, title: I18n.t('communal_area.education_address') },
        type: { value: @object.object_type, title: I18n.t('communal_area.education_object_type') },
        site: { value: @object.site, title: I18n.t('communal_area.education_site') }
      }
    end
  end
end
