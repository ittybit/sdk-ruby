# frozen_string_literal: true

require_relative "automation_trigger_conditions_item"
require "ostruct"
require "json"

module Ittybit
  # The event and conditions that trigger this automation.
  class AutomationTrigger
    # @return [String] The event that triggers the automation
    attr_reader :event
    # @return [Array<Ittybit::AutomationTriggerConditionsItem>] Conditions that must be met for the trigger to activate.
    attr_reader :conditions
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param event [String] The event that triggers the automation
    # @param conditions [Array<Ittybit::AutomationTriggerConditionsItem>] Conditions that must be met for the trigger to activate.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::AutomationTrigger]
    def initialize(event:, conditions: OMIT, additional_properties: nil)
      @event = event
      @conditions = conditions if conditions != OMIT
      @additional_properties = additional_properties
      @_field_set = { "event": event, "conditions": conditions }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AutomationTrigger
    #
    # @param json_object [String]
    # @return [Ittybit::AutomationTrigger]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      event = parsed_json["event"]
      conditions = parsed_json["conditions"]&.map do |item|
        item = item.to_json
        Ittybit::AutomationTriggerConditionsItem.from_json(json_object: item)
      end
      new(
        event: event,
        conditions: conditions,
        additional_properties: struct
      )
    end

    # Serialize an instance of AutomationTrigger to a JSON object
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
      obj.event.is_a?(String) != false || raise("Passed value for field obj.event is not the expected type, validation failed.")
      obj.conditions&.is_a?(Array) != false || raise("Passed value for field obj.conditions is not the expected type, validation failed.")
    end
  end
end
