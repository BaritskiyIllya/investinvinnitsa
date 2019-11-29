module Models
  class InvestProject
    def initialize(object)
      @object = object
    end

    def pop_up
      {
        name: { value: @object.name, title: I18n.t('invest_project.name') },
        investment_type: { value: @object.investment_type.try(:name),
                           title: I18n.t('invest_project.investment_type_id') },
        invest_sum: { value: @object.invest_sum, title: I18n.t('invest_project.invest_sum') },
        realization_term: { value: @object.realization_term, title: I18n.t('invest_project.realization_term') },
        payback_period: { value: @object.payback_period, title: I18n.t('invest_project.payback_period') },
        # area: { value: @object.area, title: I18n.t('invest_project.area') },
        # ownership: { value: @object.ownership.try(:name), title: I18n.t('invest_project.ownership_id') },
        # market: { value: @object.market, title: I18n.t('invest_project.market') },
        # current_use: { value: @object.current_use, title: I18n.t('invest_project.current_use') },
        # destination: { value: @object.destination, title: I18n.t('invest_project.destination') },
        short_description: { value: @object.short_description, title: I18n.t('invest_project.short_description') }
      }
    end
  end
end
