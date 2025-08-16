# frozen_string_literal: true

require_relative "automations_list_response_data_item_trigger"
require_relative "automations_list_response_data_item_workflow_item"
require_relative "automations_list_response_data_item_status"
require "date"
require "ostruct"
require "json"

module Ittybit
  class Automations
    class AutomationsListResponseDataItem
      # @return [String]
      attr_reader :id
      # @return [String]
      attr_reader :name
      # @return [String]
      attr_reader :description
      # @return [Ittybit::Automations::AutomationsListResponseDataItemTrigger]
      attr_reader :trigger
      # @return [Array<Ittybit::Automations::AutomationsListResponseDataItemWorkflowItem>]
      attr_reader :workflow
      # @return [Ittybit::Automations::AutomationsListResponseDataItemStatus]
      attr_reader :status
      # @return [DateTime]
      attr_reader :created
      # @return [DateTime]
      attr_reader :updated
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param name [String]
      # @param description [String]
      # @param trigger [Ittybit::Automations::AutomationsListResponseDataItemTrigger]
      # @param workflow [Array<Ittybit::Automations::AutomationsListResponseDataItemWorkflowItem>]
      # @param status [Ittybit::Automations::AutomationsListResponseDataItemStatus]
      # @param created [DateTime]
      # @param updated [DateTime]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ittybit::Automations::AutomationsListResponseDataItem]
      def initialize(id:, trigger:, workflow:, status:, created:, updated:, name: OMIT, description: OMIT,
                     additional_properties: nil)
        @id = id
        @name = name if name != OMIT
        @description = description if description != OMIT
        @trigger = trigger
        @workflow = workflow
        @status = status
        @created = created
        @updated = updated
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "name": name,
          "description": description,
          "trigger": trigger,
          "workflow": workflow,
          "status": status,
          "created": created,
          "updated": updated
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AutomationsListResponseDataItem
      #
      # @param json_object [String]
      # @return [Ittybit::Automations::AutomationsListResponseDataItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        name = parsed_json["name"]
        description = parsed_json["description"]
        if parsed_json["trigger"].nil?
          trigger = nil
        else
          trigger = parsed_json["trigger"].to_json
          trigger = Ittybit::Automations::AutomationsListResponseDataItemTrigger.from_json(json_object: trigger)
        end
        workflow = parsed_json["workflow"]&.map do |item|
          item = item.to_json
          Ittybit::Automations::AutomationsListResponseDataItemWorkflowItem.from_json(json_object: item)
        end
        status = parsed_json["status"]
        created = (DateTime.parse(parsed_json["created"]) unless parsed_json["created"].nil?)
        updated = (DateTime.parse(parsed_json["updated"]) unless parsed_json["updated"].nil?)
        new(
          id: id,
          name: name,
          description: description,
          trigger: trigger,
          workflow: workflow,
          status: status,
          created: created,
          updated: updated,
          additional_properties: struct
        )
      end

      # Serialize an instance of AutomationsListResponseDataItem to a JSON object
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
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        Ittybit::Automations::AutomationsListResponseDataItemTrigger.validate_raw(obj: obj.trigger)
        obj.workflow.is_a?(Array) != false || raise("Passed value for field obj.workflow is not the expected type, validation failed.")
        obj.status.is_a?(Ittybit::Automations::AutomationsListResponseDataItemStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.created.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
        obj.updated.is_a?(DateTime) != false || raise("Passed value for field obj.updated is not the expected type, validation failed.")
      end
    end
  end
end
