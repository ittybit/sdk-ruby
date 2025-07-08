# frozen_string_literal: true

require "json"
require_relative "workflow_task_step"
require_relative "conditions_task_step"

module Ittybit
  class AutomationWorkflowItem
    # Deserialize a JSON object to an instance of AutomationWorkflowItem
    #
    # @param json_object [String]
    # @return [Ittybit::AutomationWorkflowItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Ittybit::WorkflowTaskStep.validate_raw(obj: struct)
        return Ittybit::WorkflowTaskStep.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Ittybit::ConditionsTaskStep.validate_raw(obj: struct)
        return Ittybit::ConditionsTaskStep.from_json(json_object: struct) unless struct.nil?

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
        return Ittybit::WorkflowTaskStep.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Ittybit::ConditionsTaskStep.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
