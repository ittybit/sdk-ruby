# frozen_string_literal: true

require "ostruct"
require "json"

module Ittybit
  class AutomationTriggerConditionsItem
    # @return [String] The property to check (e.g., file.type, file.size)
    attr_reader :prop
    # @return [String] The value the property must match
    attr_reader :value
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param prop [String] The property to check (e.g., file.type, file.size)
    # @param value [String] The value the property must match
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::AutomationTriggerConditionsItem]
    def initialize(prop:, value:, additional_properties: nil)
      @prop = prop
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "prop": prop, "value": value }
    end

    # Deserialize a JSON object to an instance of AutomationTriggerConditionsItem
    #
    # @param json_object [String]
    # @return [Ittybit::AutomationTriggerConditionsItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      prop = parsed_json["prop"]
      value = parsed_json["value"]
      new(
        prop: prop,
        value: value,
        additional_properties: struct
      )
    end

    # Serialize an instance of AutomationTriggerConditionsItem to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.prop.is_a?(String) != false || raise("Passed value for field obj.prop is not the expected type, validation failed.")
      obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
