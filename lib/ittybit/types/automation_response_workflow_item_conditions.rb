# frozen_string_literal: true

require_relative "automation_response_workflow_item_conditions_conditions_item"
require_relative "automation_response_workflow_item_conditions_next_item"
require "ostruct"
require "json"

module Ittybit
  class AutomationResponseWorkflowItemConditions
    # @return [String]
    attr_reader :kind
    # @return [Array<Ittybit::AutomationResponseWorkflowItemConditionsConditionsItem>]
    attr_reader :conditions
    # @return [Array<Ittybit::AutomationResponseWorkflowItemConditionsNextItem>]
    attr_reader :next_
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param kind [String]
    # @param conditions [Array<Ittybit::AutomationResponseWorkflowItemConditionsConditionsItem>]
    # @param next_ [Array<Ittybit::AutomationResponseWorkflowItemConditionsNextItem>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::AutomationResponseWorkflowItemConditions]
    def initialize(kind:, conditions:, next_: OMIT, additional_properties: nil)
      @kind = kind
      @conditions = conditions
      @next_ = next_ if next_ != OMIT
      @additional_properties = additional_properties
      @_field_set = { "kind": kind, "conditions": conditions, "next": next_ }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of
    #  AutomationResponseWorkflowItemConditions
    #
    # @param json_object [String]
    # @return [Ittybit::AutomationResponseWorkflowItemConditions]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      kind = parsed_json["kind"]
      conditions = parsed_json["conditions"]&.map do |item|
        item = item.to_json
        Ittybit::AutomationResponseWorkflowItemConditionsConditionsItem.from_json(json_object: item)
      end
      next_ = parsed_json["next"]&.map do |item|
        item = item.to_json
        Ittybit::AutomationResponseWorkflowItemConditionsNextItem.from_json(json_object: item)
      end
      new(
        kind: kind,
        conditions: conditions,
        next_: next_,
        additional_properties: struct
      )
    end

    # Serialize an instance of AutomationResponseWorkflowItemConditions to a JSON
    #  object
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
      obj.kind.is_a?(String) != false || raise("Passed value for field obj.kind is not the expected type, validation failed.")
      obj.conditions.is_a?(Array) != false || raise("Passed value for field obj.conditions is not the expected type, validation failed.")
      obj.next_&.is_a?(Array) != false || raise("Passed value for field obj.next_ is not the expected type, validation failed.")
    end
  end
end
