# frozen_string_literal: true

require_relative "meta"
require_relative "task"
require_relative "error"
require_relative "links"
require "ostruct"
require "json"

module Ittybit
  class TaskResponse
    # @return [Ittybit::META]
    attr_reader :meta
    # @return [Ittybit::Task]
    attr_reader :data
    # @return [Ittybit::Error]
    attr_reader :error
    # @return [Ittybit::Links]
    attr_reader :links
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param meta [Ittybit::META]
    # @param data [Ittybit::Task]
    # @param error [Ittybit::Error]
    # @param links [Ittybit::Links]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::TaskResponse]
    def initialize(meta: OMIT, data: OMIT, error: OMIT, links: OMIT, additional_properties: nil)
      @meta = meta if meta != OMIT
      @data = data if data != OMIT
      @error = error if error != OMIT
      @links = links if links != OMIT
      @additional_properties = additional_properties
      @_field_set = { "meta": meta, "data": data, "error": error, "links": links }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TaskResponse
    #
    # @param json_object [String]
    # @return [Ittybit::TaskResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      meta = parsed_json["meta"]
      if parsed_json["data"].nil?
        data = nil
      else
        data = parsed_json["data"].to_json
        data = Ittybit::Task.from_json(json_object: data)
      end
      if parsed_json["error"].nil?
        error = nil
      else
        error = parsed_json["error"].to_json
        error = Ittybit::Error.from_json(json_object: error)
      end
      if parsed_json["links"].nil?
        links = nil
      else
        links = parsed_json["links"].to_json
        links = Ittybit::Links.from_json(json_object: links)
      end
      new(
        meta: meta,
        data: data,
        error: error,
        links: links,
        additional_properties: struct
      )
    end

    # Serialize an instance of TaskResponse to a JSON object
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
      obj.data.nil? || Ittybit::Task.validate_raw(obj: obj.data)
      obj.error.nil? || Ittybit::Error.validate_raw(obj: obj.error)
      obj.links.nil? || Ittybit::Links.validate_raw(obj: obj.links)
    end
  end
end
