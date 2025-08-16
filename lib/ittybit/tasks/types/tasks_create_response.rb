# frozen_string_literal: true

require_relative "tasks_create_response_meta"
require_relative "tasks_create_response_data"
require_relative "tasks_create_response_error"
require_relative "tasks_create_response_links"
require "ostruct"
require "json"

module Ittybit
  class Tasks
    class TasksCreateResponse
      # @return [Ittybit::Tasks::TasksCreateResponseMeta]
      attr_reader :meta
      # @return [Ittybit::Tasks::TasksCreateResponseData]
      attr_reader :data
      # @return [Ittybit::Tasks::TasksCreateResponseError]
      attr_reader :error
      # @return [Ittybit::Tasks::TasksCreateResponseLinks]
      attr_reader :links
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param meta [Ittybit::Tasks::TasksCreateResponseMeta]
      # @param data [Ittybit::Tasks::TasksCreateResponseData]
      # @param error [Ittybit::Tasks::TasksCreateResponseError]
      # @param links [Ittybit::Tasks::TasksCreateResponseLinks]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ittybit::Tasks::TasksCreateResponse]
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

      # Deserialize a JSON object to an instance of TasksCreateResponse
      #
      # @param json_object [String]
      # @return [Ittybit::Tasks::TasksCreateResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["meta"].nil?
          meta = nil
        else
          meta = parsed_json["meta"].to_json
          meta = Ittybit::Tasks::TasksCreateResponseMeta.from_json(json_object: meta)
        end
        if parsed_json["data"].nil?
          data = nil
        else
          data = parsed_json["data"].to_json
          data = Ittybit::Tasks::TasksCreateResponseData.from_json(json_object: data)
        end
        if parsed_json["error"].nil?
          error = nil
        else
          error = parsed_json["error"].to_json
          error = Ittybit::Tasks::TasksCreateResponseError.from_json(json_object: error)
        end
        if parsed_json["links"].nil?
          links = nil
        else
          links = parsed_json["links"].to_json
          links = Ittybit::Tasks::TasksCreateResponseLinks.from_json(json_object: links)
        end
        new(
          meta: meta,
          data: data,
          error: error,
          links: links,
          additional_properties: struct
        )
      end

      # Serialize an instance of TasksCreateResponse to a JSON object
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
        obj.meta.nil? || Ittybit::Tasks::TasksCreateResponseMeta.validate_raw(obj: obj.meta)
        obj.data.nil? || Ittybit::Tasks::TasksCreateResponseData.validate_raw(obj: obj.data)
        obj.error.nil? || Ittybit::Tasks::TasksCreateResponseError.validate_raw(obj: obj.error)
        obj.links.nil? || Ittybit::Tasks::TasksCreateResponseLinks.validate_raw(obj: obj.links)
      end
    end
  end
end
