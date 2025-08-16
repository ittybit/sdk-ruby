# frozen_string_literal: true

require_relative "tasks_list_response_meta"
require_relative "tasks_list_response_data_item"
require_relative "tasks_list_response_error"
require_relative "tasks_list_response_links"
require "ostruct"
require "json"

module Ittybit
  class Tasks
    class TasksListResponse
      # @return [Ittybit::Tasks::TasksListResponseMeta]
      attr_reader :meta
      # @return [Array<Ittybit::Tasks::TasksListResponseDataItem>]
      attr_reader :data
      # @return [Ittybit::Tasks::TasksListResponseError]
      attr_reader :error
      # @return [Ittybit::Tasks::TasksListResponseLinks]
      attr_reader :links
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param meta [Ittybit::Tasks::TasksListResponseMeta]
      # @param data [Array<Ittybit::Tasks::TasksListResponseDataItem>]
      # @param error [Ittybit::Tasks::TasksListResponseError]
      # @param links [Ittybit::Tasks::TasksListResponseLinks]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ittybit::Tasks::TasksListResponse]
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

      # Deserialize a JSON object to an instance of TasksListResponse
      #
      # @param json_object [String]
      # @return [Ittybit::Tasks::TasksListResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["meta"].nil?
          meta = nil
        else
          meta = parsed_json["meta"].to_json
          meta = Ittybit::Tasks::TasksListResponseMeta.from_json(json_object: meta)
        end
        data = parsed_json["data"]&.map do |item|
          item = item.to_json
          Ittybit::Tasks::TasksListResponseDataItem.from_json(json_object: item)
        end
        if parsed_json["error"].nil?
          error = nil
        else
          error = parsed_json["error"].to_json
          error = Ittybit::Tasks::TasksListResponseError.from_json(json_object: error)
        end
        if parsed_json["links"].nil?
          links = nil
        else
          links = parsed_json["links"].to_json
          links = Ittybit::Tasks::TasksListResponseLinks.from_json(json_object: links)
        end
        new(
          meta: meta,
          data: data,
          error: error,
          links: links,
          additional_properties: struct
        )
      end

      # Serialize an instance of TasksListResponse to a JSON object
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
        obj.meta.nil? || Ittybit::Tasks::TasksListResponseMeta.validate_raw(obj: obj.meta)
        obj.data&.is_a?(Array) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
        obj.error.nil? || Ittybit::Tasks::TasksListResponseError.validate_raw(obj: obj.error)
        obj.links.nil? || Ittybit::Tasks::TasksListResponseLinks.validate_raw(obj: obj.links)
      end
    end
  end
end
