# frozen_string_literal: true

require "json"
require_relative "automation_list_response_data_item_workflow_item_ref"
require_relative "automation_list_response_data_item_workflow_item_conditions"

module Ittybit
  class AutomationListResponseDataItemWorkflowItem
    # Deserialize a JSON object to an instance of
    #  AutomationListResponseDataItemWorkflowItem
    #
    # @param json_object [String]
    # @return [Ittybit::AutomationListResponseDataItemWorkflowItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Ittybit::AutomationListResponseDataItemWorkflowItemRef.validate_raw(obj: struct)
        return Ittybit::AutomationListResponseDataItemWorkflowItemRef.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Ittybit::AutomationListResponseDataItemWorkflowItemConditions.validate_raw(obj: struct)
        unless struct.nil?
          return Ittybit::AutomationListResponseDataItemWorkflowItemConditions.from_json(json_object: struct)
        end

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
        return Ittybit::AutomationListResponseDataItemWorkflowItemRef.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Ittybit::AutomationListResponseDataItemWorkflowItemConditions.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
