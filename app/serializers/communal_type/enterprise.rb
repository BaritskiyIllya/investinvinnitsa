module CommunalType
  class Enterprise
    def initialize(object)
      @object = object
    end

    def pop_up
      {
        name: { value: @object.object_name, title: I18n.t('communal_area.enterprise_object_name') },
        address: { value: @object.address, title: I18n.t('communal_area.enterprise_address') },
        branch: { value: @object.object_type, title: I18n.t('communal_area.communal_branch_id') },
        site: { value: @object.site, title: I18n.t('communal_area.enterprise_site') }
      }
    end
  end
end
