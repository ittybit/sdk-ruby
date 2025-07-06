# frozen_string_literal: true

require_relative "automation_trigger"
require_relative "workflow_task_step"
require_relative "automation_status"
require "date"
require "ostruct"
require "json"

module Ittybit
  class Automation
    # @return [String]
    attr_reader :id
    # @return [String]
    attr_reader :name
    # @return [String]
    attr_reader :description
    # @return [Ittybit::AutomationTrigger]
    attr_reader :trigger
    # @return [Array<Ittybit::WorkflowTaskStep>]
    attr_reader :workflow
    # @return [Ittybit::AutomationStatus]
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
    # @param trigger [Ittybit::AutomationTrigger]
    # @param workflow [Array<Ittybit::WorkflowTaskStep>]
    # @param status [Ittybit::AutomationStatus]
    # @param created [DateTime]
    # @param updated [DateTime]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::Automation]
    def initialize(id:, name:, trigger:, workflow:, status:, created:, updated:, description: OMIT,
                   additional_properties: nil)
      @id = id
      @name = name
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

    # Deserialize a JSON object to an instance of Automation
    #
    # @param json_object [String]
    # @return [Ittybit::Automation]
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
        trigger = Ittybit::AutomationTrigger.from_json(json_object: trigger)
      end
      workflow = parsed_json["workflow"]&.map do |item|
        item = item.to_json
        Ittybit::WorkflowTaskStep.from_json(json_object: item)
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

    # Serialize an instance of Automation to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      Ittybit::AutomationTrigger.validate_raw(obj: obj.trigger)
      obj.workflow.is_a?(Array) != false || raise("Passed value for field obj.workflow is not the expected type, validation failed.")
      obj.status.is_a?(Ittybit::AutomationStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.created.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      obj.updated.is_a?(DateTime) != false || raise("Passed value for field obj.updated is not the expected type, validation failed.")
    end
  end
end
