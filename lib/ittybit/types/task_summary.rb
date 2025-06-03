# frozen_string_literal: true

require_relative "task_summary_kind"
require_relative "task_summary_status"
require "date"
require "ostruct"
require "json"

module Ittybit
  class TaskSummary
    # @return [String] Unique identifier for the task.
    attr_reader :id
    # @return [String] Object type, always 'task'.
    attr_reader :object
    # @return [Ittybit::TaskSummaryKind] The type of operation the task performs.
    attr_reader :kind
    # @return [Ittybit::TaskSummaryStatus] Current status of the task.
    attr_reader :status
    # @return [Integer] Task progress percentage.
    attr_reader :progress
    # @return [String] Error message if the task failed.
    attr_reader :error
    # @return [String] ID of the entity that created the task (e.g., user ID, automation ID).
    attr_reader :created_by
    # @return [DateTime] Timestamp when the task was created.
    attr_reader :created
    # @return [DateTime] Timestamp when the task was last updated.
    attr_reader :updated
    # @return [String] ID of the parent task if this is part of a workflow.
    attr_reader :parent_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Unique identifier for the task.
    # @param object [String] Object type, always 'task'.
    # @param kind [Ittybit::TaskSummaryKind] The type of operation the task performs.
    # @param status [Ittybit::TaskSummaryStatus] Current status of the task.
    # @param progress [Integer] Task progress percentage.
    # @param error [String] Error message if the task failed.
    # @param created_by [String] ID of the entity that created the task (e.g., user ID, automation ID).
    # @param created [DateTime] Timestamp when the task was created.
    # @param updated [DateTime] Timestamp when the task was last updated.
    # @param parent_id [String] ID of the parent task if this is part of a workflow.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::TaskSummary]
    def initialize(id:, object:, kind:, status:, created:, updated:, progress: OMIT, error: OMIT, created_by: OMIT,
                   parent_id: OMIT, additional_properties: nil)
      @id = id
      @object = object
      @kind = kind
      @status = status
      @progress = progress if progress != OMIT
      @error = error if error != OMIT
      @created_by = created_by if created_by != OMIT
      @created = created
      @updated = updated
      @parent_id = parent_id if parent_id != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "object": object,
        "kind": kind,
        "status": status,
        "progress": progress,
        "error": error,
        "created_by": created_by,
        "created": created,
        "updated": updated,
        "parent_id": parent_id
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TaskSummary
    #
    # @param json_object [String]
    # @return [Ittybit::TaskSummary]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      object = parsed_json["object"]
      kind = parsed_json["kind"]
      status = parsed_json["status"]
      progress = parsed_json["progress"]
      error = parsed_json["error"]
      created_by = parsed_json["created_by"]
      created = (DateTime.parse(parsed_json["created"]) unless parsed_json["created"].nil?)
      updated = (DateTime.parse(parsed_json["updated"]) unless parsed_json["updated"].nil?)
      parent_id = parsed_json["parent_id"]
      new(
        id: id,
        object: object,
        kind: kind,
        status: status,
        progress: progress,
        error: error,
        created_by: created_by,
        created: created,
        updated: updated,
        parent_id: parent_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of TaskSummary to a JSON object
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
      obj.object.is_a?(String) != false || raise("Passed value for field obj.object is not the expected type, validation failed.")
      obj.kind.is_a?(Ittybit::TaskSummaryKind) != false || raise("Passed value for field obj.kind is not the expected type, validation failed.")
      obj.status.is_a?(Ittybit::TaskSummaryStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.progress&.is_a?(Integer) != false || raise("Passed value for field obj.progress is not the expected type, validation failed.")
      obj.error&.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
      obj.created_by&.is_a?(String) != false || raise("Passed value for field obj.created_by is not the expected type, validation failed.")
      obj.created.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      obj.updated.is_a?(DateTime) != false || raise("Passed value for field obj.updated is not the expected type, validation failed.")
      obj.parent_id&.is_a?(String) != false || raise("Passed value for field obj.parent_id is not the expected type, validation failed.")
    end
  end
end
