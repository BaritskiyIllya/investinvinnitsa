module Factories
  class Communal
    LAYERS = { 10 => 'Education', 7 => 'Enterprise' }

    def initialize(object)
      @object = object
      @map_layer = object.map_layer_id.to_i
      @available_layers = LAYERS
    end

    def call
      return 'CommunalType::General'.classify.constantize.new(@object) if @available_layers[@map_layer].nil?
      "CommunalType::#{@available_layers[@map_layer]}".classify.constantize.new(@object)
    end

    attr_reader :available_layers
  end
end
