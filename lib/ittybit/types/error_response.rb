# frozen_string_literal: true

require_relative "meta"
require_relative "error"
require "ostruct"
require "json"

module Ittybit
  class ErrorResponse
    # @return [Ittybit::META]
    attr_reader :meta
    # @return [Ittybit::Error]
    attr_reader :error
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param meta [Ittybit::META]
    # @param error [Ittybit::Error]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::ErrorResponse]
    def initialize(meta: OMIT, error: OMIT, additional_properties: nil)
      @meta = meta if meta != OMIT
      @error = error if error != OMIT
      @additional_properties = additional_properties
      @_field_set = { "meta": meta, "error": error }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ErrorResponse
    #
    # @param json_object [String]
    # @return [Ittybit::ErrorResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      meta = parsed_json["meta"]
      if parsed_json["error"].nil?
        error = nil
      else
        error = parsed_json["error"].to_json
        error = Ittybit::Error.from_json(json_object: error)
      end
      new(
        meta: meta,
        error: error,
        additional_properties: struct
      )
    end

    # Serialize an instance of ErrorResponse to a JSON object
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
      obj.meta&.is_a?(Object) != false || raise("Passed value for field obj.meta is not the expected type, validation failed.")
      obj.error.nil? || Ittybit::Error.validate_raw(obj: obj.error)
    end
  end
end
