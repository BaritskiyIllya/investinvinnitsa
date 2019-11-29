module Models
  class CommunalArea
    require 'factories/communal'

    def initialize(object)
      @object = object
    end

    def pop_up
      @factory = Factories::Communal.new(@object).call
      @factory.pop_up
    end
  end
end
