# frozen_string_literal: true

require "ostruct"
require "json"

module Ittybit
  class AutomationResponseWorkflowItemRefNextItem
    # @return [String]
    attr_reader :kind
    # @return [String]
    attr_reader :ref
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param kind [String]
    # @param ref [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::AutomationResponseWorkflowItemRefNextItem]
    def initialize(kind: OMIT, ref: OMIT, additional_properties: nil)
      @kind = kind if kind != OMIT
      @ref = ref if ref != OMIT
      @additional_properties = additional_properties
      @_field_set = { "kind": kind, "ref": ref }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of
    #  AutomationResponseWorkflowItemRefNextItem
    #
    # @param json_object [String]
    # @return [Ittybit::AutomationResponseWorkflowItemRefNextItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      kind = parsed_json["kind"]
      ref = parsed_json["ref"]
      new(
        kind: kind,
        ref: ref,
        additional_properties: struct
      )
    end

    # Serialize an instance of AutomationResponseWorkflowItemRefNextItem to a JSON
    #  object
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
      obj.kind&.is_a?(String) != false || raise("Passed value for field obj.kind is not the expected type, validation failed.")
      obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
    end
  end
end
