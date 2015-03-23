module Swaggard
  class Model

    attr_reader :model_name

    def initialize(yard_object)
      @model_name = yard_object.name
      @properties = []
    end

    def add_property(property)
      @properties << property
    end

    def id
      @model_name
    end

    def attributes_model_names
      @properties.map(&:model_name).compact
    end

    def to_h
      {
        "id"=> @model_name,
        "description" => '111111',
        "properties" => Hash[@properties.map {|property| [property.property_name, property.to_h]}],
        "required"=> []
      }
    end

  end
end