module Models
  class OfficeArea
    def initialize(object)
      @object = object
    end

    def pop_up
      {
        address: { value: @object.address, title: I18n.t('office_area.address') },
        total_area: { value: @object.total_area, title: I18n.t('office_area.total_area') },
        area_class: { value: @object.area_class, title: I18n.t('office_area.area_class') },
        transfer_type: { value: @object.transfer_type, title: I18n.t('office_area.transfer_type') }
      }
    end
  end
end
