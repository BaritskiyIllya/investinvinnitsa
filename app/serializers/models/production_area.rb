module Models
  class ProductionArea
    def initialize(object)
      @object = object
    end

    def pop_up
      {
        address: { value: @object.address, title: I18n.t('production_area.address') },
        ownership: { value: @object.ownership.try(:name), title: I18n.t('production_area.ownership_id') },
        production_area: { value: @object.production_area, title: I18n.t('production_area.production_area') },
        transfer_type: { value: @object.transfer_type, title: I18n.t('production_area.transfer_type') }
      }
    end
  end
end
