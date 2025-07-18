# frozen_string_literal: true

require "ostruct"
require "json"

module Ittybit
  class ConditionsTaskStepConditionsItem
    # @return [String]
    attr_reader :prop
    # @return [String]
    attr_reader :value
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param prop [String]
    # @param value [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::ConditionsTaskStepConditionsItem]
    def initialize(prop: OMIT, value: OMIT, additional_properties: nil)
      @prop = prop if prop != OMIT
      @value = value if value != OMIT
      @additional_properties = additional_properties
      @_field_set = { "prop": prop, "value": value }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ConditionsTaskStepConditionsItem
    #
    # @param json_object [String]
    # @return [Ittybit::ConditionsTaskStepConditionsItem]
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

    # Serialize an instance of ConditionsTaskStepConditionsItem to a JSON object
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
      obj.prop&.is_a?(String) != false || raise("Passed value for field obj.prop is not the expected type, validation failed.")
      obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
