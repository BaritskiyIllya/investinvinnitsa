module Models
  class LandArea
    def initialize(object)
      @object = object
    end

    def pop_up
      {
        area_name: { value: @object.area_name, title: I18n.t('land_area.area_name') },
        area_type: { value: @object.area_type, title: I18n.t('land_area.area_type') },
        total_area: { value: @object.total_area, title: I18n.t('land_area.total_area') },
        ownership: { value: @object.ownership.try(:name), title: I18n.t('land_area.ownership_id') },
        cadastral_number: { value: @object.cadastral_number, title: I18n.t('land_area.cadastral_number') },
        transfer_type: { value: @object.transfer_type, title: I18n.t('land_area.transfer_type') }
      }
    end
  end
end
