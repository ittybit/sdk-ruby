# frozen_string_literal: true

require "json"
require_relative "automations_get_response_data_workflow_item_ref"
require_relative "automations_get_response_data_workflow_item_conditions"

module Ittybit
  class Automations
    class AutomationsGetResponseDataWorkflowItem
      # Deserialize a JSON object to an instance of
      #  AutomationsGetResponseDataWorkflowItem
      #
      # @param json_object [String]
      # @return [Ittybit::Automations::AutomationsGetResponseDataWorkflowItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Ittybit::Automations::AutomationsGetResponseDataWorkflowItemRef.validate_raw(obj: struct)
          unless struct.nil?
            return Ittybit::Automations::AutomationsGetResponseDataWorkflowItemRef.from_json(json_object: struct)
          end

          return nil
        rescue StandardError
          # noop
        end
        begin
          Ittybit::Automations::AutomationsGetResponseDataWorkflowItemConditions.validate_raw(obj: struct)
          unless struct.nil?
            return Ittybit::Automations::AutomationsGetResponseDataWorkflowItemConditions.from_json(json_object: struct)
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
          return Ittybit::Automations::AutomationsGetResponseDataWorkflowItemRef.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Ittybit::Automations::AutomationsGetResponseDataWorkflowItemConditions.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
