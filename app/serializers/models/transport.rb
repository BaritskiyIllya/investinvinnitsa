module Models
  class Transport
    def initialize(object)
      @object = object
    end

    def pop_up
      {
        name: { value: @object.name, title: I18n.t('transport.name') },
        route: { value: @object.route, title: I18n.t('transport.route') },
        transport_type: { value: @object.transport_type.name, title: I18n.t('transport.transport_type') }
      }
    end
  end
end
