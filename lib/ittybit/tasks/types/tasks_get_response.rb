# frozen_string_literal: true

require_relative "tasks_get_response_meta"
require_relative "tasks_get_response_data"
require_relative "tasks_get_response_error"
require_relative "tasks_get_response_links"
require "ostruct"
require "json"

module Ittybit
  class Tasks
    class TasksGetResponse
      # @return [Ittybit::Tasks::TasksGetResponseMeta]
      attr_reader :meta
      # @return [Ittybit::Tasks::TasksGetResponseData]
      attr_reader :data
      # @return [Ittybit::Tasks::TasksGetResponseError]
      attr_reader :error
      # @return [Ittybit::Tasks::TasksGetResponseLinks]
      attr_reader :links
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param meta [Ittybit::Tasks::TasksGetResponseMeta]
      # @param data [Ittybit::Tasks::TasksGetResponseData]
      # @param error [Ittybit::Tasks::TasksGetResponseError]
      # @param links [Ittybit::Tasks::TasksGetResponseLinks]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ittybit::Tasks::TasksGetResponse]
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

      # Deserialize a JSON object to an instance of TasksGetResponse
      #
      # @param json_object [String]
      # @return [Ittybit::Tasks::TasksGetResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["meta"].nil?
          meta = nil
        else
          meta = parsed_json["meta"].to_json
          meta = Ittybit::Tasks::TasksGetResponseMeta.from_json(json_object: meta)
        end
        if parsed_json["data"].nil?
          data = nil
        else
          data = parsed_json["data"].to_json
          data = Ittybit::Tasks::TasksGetResponseData.from_json(json_object: data)
        end
        if parsed_json["error"].nil?
          error = nil
        else
          error = parsed_json["error"].to_json
          error = Ittybit::Tasks::TasksGetResponseError.from_json(json_object: error)
        end
        if parsed_json["links"].nil?
          links = nil
        else
          links = parsed_json["links"].to_json
          links = Ittybit::Tasks::TasksGetResponseLinks.from_json(json_object: links)
        end
        new(
          meta: meta,
          data: data,
          error: error,
          links: links,
          additional_properties: struct
        )
      end

      # Serialize an instance of TasksGetResponse to a JSON object
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
        obj.meta.nil? || Ittybit::Tasks::TasksGetResponseMeta.validate_raw(obj: obj.meta)
        obj.data.nil? || Ittybit::Tasks::TasksGetResponseData.validate_raw(obj: obj.data)
        obj.error.nil? || Ittybit::Tasks::TasksGetResponseError.validate_raw(obj: obj.error)
        obj.links.nil? || Ittybit::Tasks::TasksGetResponseLinks.validate_raw(obj: obj.links)
      end
    end
  end
end
