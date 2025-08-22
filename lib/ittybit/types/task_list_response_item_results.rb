# frozen_string_literal: true

require "ostruct"
require "json"

module Ittybit
  class TaskListResponseItemResults
    # @return [Array<Hash{String => Object}>]
    attr_reader :passed
    # @return [Array<Hash{String => Object}>]
    attr_reader :failed
    # @return [Boolean]
    attr_reader :continue
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param passed [Array<Hash{String => Object}>]
    # @param failed [Array<Hash{String => Object}>]
    # @param continue [Boolean]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::TaskListResponseItemResults]
    def initialize(passed: OMIT, failed: OMIT, continue: OMIT, additional_properties: nil)
      @passed = passed if passed != OMIT
      @failed = failed if failed != OMIT
      @continue = continue if continue != OMIT
      @additional_properties = additional_properties
      @_field_set = { "passed": passed, "failed": failed, "continue": continue }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TaskListResponseItemResults
    #
    # @param json_object [String]
    # @return [Ittybit::TaskListResponseItemResults]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      passed = parsed_json["passed"]
      failed = parsed_json["failed"]
      continue = parsed_json["continue"]
      new(
        passed: passed,
        failed: failed,
        continue: continue,
        additional_properties: struct
      )
    end

    # Serialize an instance of TaskListResponseItemResults to a JSON object
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
      obj.passed&.is_a?(Array) != false || raise("Passed value for field obj.passed is not the expected type, validation failed.")
      obj.failed&.is_a?(Array) != false || raise("Passed value for field obj.failed is not the expected type, validation failed.")
      obj.continue&.is_a?(Boolean) != false || raise("Passed value for field obj.continue is not the expected type, validation failed.")
    end
  end
end
