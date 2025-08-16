# frozen_string_literal: true

require "json"
require_relative "automation_response_data_workflow_item_ref"
require_relative "automation_response_data_workflow_item_conditions"

module Ittybit
  class AutomationResponseDataWorkflowItem
    # Deserialize a JSON object to an instance of AutomationResponseDataWorkflowItem
    #
    # @param json_object [String]
    # @return [Ittybit::AutomationResponseDataWorkflowItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Ittybit::AutomationResponseDataWorkflowItemRef.validate_raw(obj: struct)
        return Ittybit::AutomationResponseDataWorkflowItemRef.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Ittybit::AutomationResponseDataWorkflowItemConditions.validate_raw(obj: struct)
        return Ittybit::AutomationResponseDataWorkflowItemConditions.from_json(json_object: struct) unless struct.nil?

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
        return Ittybit::AutomationResponseDataWorkflowItemRef.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Ittybit::AutomationResponseDataWorkflowItemConditions.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
