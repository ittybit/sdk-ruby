# frozen_string_literal: true

require_relative "task_list_response_meta"
require_relative "task_list_response_data_item"
require_relative "task_list_response_error"
require_relative "task_list_response_links"
require "ostruct"
require "json"

module Ittybit
  class TaskListResponse
    # @return [Ittybit::TaskListResponseMeta]
    attr_reader :meta
    # @return [Array<Ittybit::TaskListResponseDataItem>]
    attr_reader :data
    # @return [Ittybit::TaskListResponseError]
    attr_reader :error
    # @return [Ittybit::TaskListResponseLinks]
    attr_reader :links
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param meta [Ittybit::TaskListResponseMeta]
    # @param data [Array<Ittybit::TaskListResponseDataItem>]
    # @param error [Ittybit::TaskListResponseError]
    # @param links [Ittybit::TaskListResponseLinks]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::TaskListResponse]
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

    # Deserialize a JSON object to an instance of TaskListResponse
    #
    # @param json_object [String]
    # @return [Ittybit::TaskListResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["meta"].nil?
        meta = nil
      else
        meta = parsed_json["meta"].to_json
        meta = Ittybit::TaskListResponseMeta.from_json(json_object: meta)
      end
      data = parsed_json["data"]&.map do |item|
        item = item.to_json
        Ittybit::TaskListResponseDataItem.from_json(json_object: item)
      end
      if parsed_json["error"].nil?
        error = nil
      else
        error = parsed_json["error"].to_json
        error = Ittybit::TaskListResponseError.from_json(json_object: error)
      end
      if parsed_json["links"].nil?
        links = nil
      else
        links = parsed_json["links"].to_json
        links = Ittybit::TaskListResponseLinks.from_json(json_object: links)
      end
      new(
        meta: meta,
        data: data,
        error: error,
        links: links,
        additional_properties: struct
      )
    end

    # Serialize an instance of TaskListResponse to a JSON object
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
      obj.meta.nil? || Ittybit::TaskListResponseMeta.validate_raw(obj: obj.meta)
      obj.data&.is_a?(Array) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
      obj.error.nil? || Ittybit::TaskListResponseError.validate_raw(obj: obj.error)
      obj.links.nil? || Ittybit::TaskListResponseLinks.validate_raw(obj: obj.links)
    end
  end
end
