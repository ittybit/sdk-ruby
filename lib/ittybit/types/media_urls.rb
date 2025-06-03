# frozen_string_literal: true

require "ostruct"
require "json"

module Ittybit
  # URLs for the media item.
  class MediaUrls
    # @return [String] URL of the original source file.
    attr_reader :original
    # @return [String] Example URL for a file with the ref value "example_ref". Any key with a-z, 0-9,
    #  _, or - is possible, but keys must start with a letter.
    attr_reader :example_ref
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param original [String] URL of the original source file.
    # @param example_ref [String] Example URL for a file with the ref value "example_ref". Any key with a-z, 0-9,
    #  _, or - is possible, but keys must start with a letter.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::MediaUrls]
    def initialize(original: OMIT, example_ref: OMIT, additional_properties: nil)
      @original = original if original != OMIT
      @example_ref = example_ref if example_ref != OMIT
      @additional_properties = additional_properties
      @_field_set = { "original": original, "example_ref": example_ref }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of MediaUrls
    #
    # @param json_object [String]
    # @return [Ittybit::MediaUrls]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      original = parsed_json["original"]
      example_ref = parsed_json["example_ref"]
      new(
        original: original,
        example_ref: example_ref,
        additional_properties: struct
      )
    end

    # Serialize an instance of MediaUrls to a JSON object
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
      obj.original&.is_a?(String) != false || raise("Passed value for field obj.original is not the expected type, validation failed.")
      obj.example_ref&.is_a?(String) != false || raise("Passed value for field obj.example_ref is not the expected type, validation failed.")
    end
  end
end
