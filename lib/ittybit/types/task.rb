# frozen_string_literal: true

require_relative "task_kind"
require_relative "task_status"
require "date"
require_relative "task_results"
require "ostruct"
require "json"

module Ittybit
  class Task
    # @return [String]
    attr_reader :id
    # @return [String]
    attr_reader :object
    # @return [Ittybit::TASK_KIND]
    attr_reader :kind
    # @return [Hash{String => Object}]
    attr_reader :input
    # @return [Hash{String => Object}]
    attr_reader :options
    # @return [Hash{String => Object}]
    attr_reader :output
    # @return [Ittybit::TaskStatus]
    attr_reader :status
    # @return [Integer]
    attr_reader :progress
    # @return [String]
    attr_reader :error
    # @return [String]
    attr_reader :created_by
    # @return [DateTime]
    attr_reader :created
    # @return [DateTime]
    attr_reader :updated
    # @return [String]
    attr_reader :parent_id
    # @return [Array<Object>]
    attr_reader :workflow
    # @return [Ittybit::TaskResults]
    attr_reader :results
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String]
    # @param object [String]
    # @param kind [Ittybit::TASK_KIND]
    # @param input [Hash{String => Object}]
    # @param options [Hash{String => Object}]
    # @param output [Hash{String => Object}]
    # @param status [Ittybit::TaskStatus]
    # @param progress [Integer]
    # @param error [String]
    # @param created_by [String]
    # @param created [DateTime]
    # @param updated [DateTime]
    # @param parent_id [String]
    # @param workflow [Array<Object>]
    # @param results [Ittybit::TaskResults]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::Task]
    def initialize(id:, object:, kind:, status:, created:, updated:, input: OMIT, options: OMIT, output: OMIT, progress: OMIT, error: OMIT,
                   created_by: OMIT, parent_id: OMIT, workflow: OMIT, results: OMIT, additional_properties: nil)
      @id = id
      @object = object
      @kind = kind
      @input = input if input != OMIT
      @options = options if options != OMIT
      @output = output if output != OMIT
      @status = status
      @progress = progress if progress != OMIT
      @error = error if error != OMIT
      @created_by = created_by if created_by != OMIT
      @created = created
      @updated = updated
      @parent_id = parent_id if parent_id != OMIT
      @workflow = workflow if workflow != OMIT
      @results = results if results != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "object": object,
        "kind": kind,
        "input": input,
        "options": options,
        "output": output,
        "status": status,
        "progress": progress,
        "error": error,
        "created_by": created_by,
        "created": created,
        "updated": updated,
        "parent_id": parent_id,
        "workflow": workflow,
        "results": results
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Task
    #
    # @param json_object [String]
    # @return [Ittybit::Task]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      object = parsed_json["object"]
      kind = parsed_json["kind"]
      input = parsed_json["input"]
      options = parsed_json["options"]
      output = parsed_json["output"]
      status = parsed_json["status"]
      progress = parsed_json["progress"]
      error = parsed_json["error"]
      created_by = parsed_json["created_by"]
      created = (DateTime.parse(parsed_json["created"]) unless parsed_json["created"].nil?)
      updated = (DateTime.parse(parsed_json["updated"]) unless parsed_json["updated"].nil?)
      parent_id = parsed_json["parent_id"]
      workflow = parsed_json["workflow"]
      if parsed_json["results"].nil?
        results = nil
      else
        results = parsed_json["results"].to_json
        results = Ittybit::TaskResults.from_json(json_object: results)
      end
      new(
        id: id,
        object: object,
        kind: kind,
        input: input,
        options: options,
        output: output,
        status: status,
        progress: progress,
        error: error,
        created_by: created_by,
        created: created,
        updated: updated,
        parent_id: parent_id,
        workflow: workflow,
        results: results,
        additional_properties: struct
      )
    end

    # Serialize an instance of Task to a JSON object
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
      obj.kind.is_a?(Object) != false || raise("Passed value for field obj.kind is not the expected type, validation failed.")
      obj.input&.is_a?(Hash) != false || raise("Passed value for field obj.input is not the expected type, validation failed.")
      obj.options&.is_a?(Hash) != false || raise("Passed value for field obj.options is not the expected type, validation failed.")
      obj.output&.is_a?(Hash) != false || raise("Passed value for field obj.output is not the expected type, validation failed.")
      obj.status.is_a?(Ittybit::TaskStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.progress&.is_a?(Integer) != false || raise("Passed value for field obj.progress is not the expected type, validation failed.")
      obj.error&.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
      obj.created_by&.is_a?(String) != false || raise("Passed value for field obj.created_by is not the expected type, validation failed.")
      obj.created.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      obj.updated.is_a?(DateTime) != false || raise("Passed value for field obj.updated is not the expected type, validation failed.")
      obj.parent_id&.is_a?(String) != false || raise("Passed value for field obj.parent_id is not the expected type, validation failed.")
      obj.workflow&.is_a?(Array) != false || raise("Passed value for field obj.workflow is not the expected type, validation failed.")
      obj.results.nil? || Ittybit::TaskResults.validate_raw(obj: obj.results)
    end
  end
end
