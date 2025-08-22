# frozen_string_literal: true

require "json"
require_relative "automation_response_workflow_item_ref"
require_relative "automation_response_workflow_item_conditions"

module Ittybit
  class AutomationResponseWorkflowItem
    # Deserialize a JSON object to an instance of AutomationResponseWorkflowItem
    #
    # @param json_object [String]
    # @return [Ittybit::AutomationResponseWorkflowItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Ittybit::AutomationResponseWorkflowItemRef.validate_raw(obj: struct)
        return Ittybit::AutomationResponseWorkflowItemRef.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Ittybit::AutomationResponseWorkflowItemConditions.validate_raw(obj: struct)
        return Ittybit::AutomationResponseWorkflowItemConditions.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      struct
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return Ittybit::AutomationResponseWorkflowItemRef.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Ittybit::AutomationResponseWorkflowItemConditions.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
