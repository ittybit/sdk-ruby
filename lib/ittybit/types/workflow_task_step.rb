# frozen_string_literal: true

require_relative "workflow_task_step_kind"
require_relative "workflow_task_step_next_item"
require "ostruct"
require "json"

module Ittybit
  class WorkflowTaskStep
    # @return [Ittybit::WorkflowTaskStepKind]
    attr_reader :kind
    # @return [String]
    attr_reader :ref
    # @return [Array<Ittybit::WorkflowTaskStepNextItem>]
    attr_reader :next_
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param kind [Ittybit::WorkflowTaskStepKind]
    # @param ref [String]
    # @param next_ [Array<Ittybit::WorkflowTaskStepNextItem>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::WorkflowTaskStep]
    def initialize(kind:, ref: OMIT, next_: OMIT, additional_properties: nil)
      @kind = kind
      @ref = ref if ref != OMIT
      @next_ = next_ if next_ != OMIT
      @additional_properties = additional_properties
      @_field_set = { "kind": kind, "ref": ref, "next": next_ }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of WorkflowTaskStep
    #
    # @param json_object [String]
    # @return [Ittybit::WorkflowTaskStep]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      kind = parsed_json["kind"]
      ref = parsed_json["ref"]
      next_ = parsed_json["next"]&.map do |item|
        item = item.to_json
        Ittybit::WorkflowTaskStepNextItem.from_json(json_object: item)
      end
      new(
        kind: kind,
        ref: ref,
        next_: next_,
        additional_properties: struct
      )
    end

    # Serialize an instance of WorkflowTaskStep to a JSON object
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
      obj.kind.is_a?(Ittybit::WorkflowTaskStepKind) != false || raise("Passed value for field obj.kind is not the expected type, validation failed.")
      obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
      obj.next_&.is_a?(Array) != false || raise("Passed value for field obj.next_ is not the expected type, validation failed.")
    end
  end
end
