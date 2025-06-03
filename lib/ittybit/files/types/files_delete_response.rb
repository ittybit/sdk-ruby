# frozen_string_literal: true

require_relative "files_delete_response_data"
require_relative "../../types/meta"
require_relative "../../types/links"
require "ostruct"
require "json"

module Ittybit
  class Files
    class FilesDeleteResponse
      # @return [Ittybit::Files::FilesDeleteResponseData] Contains a confirmation message
      attr_reader :data
      # @return [Ittybit::META]
      attr_reader :meta
      # @return [Ittybit::Links]
      attr_reader :links
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param data [Ittybit::Files::FilesDeleteResponseData] Contains a confirmation message
      # @param meta [Ittybit::META]
      # @param links [Ittybit::Links]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ittybit::Files::FilesDeleteResponse]
      def initialize(data: OMIT, meta: OMIT, links: OMIT, additional_properties: nil)
        @data = data if data != OMIT
        @meta = meta if meta != OMIT
        @links = links if links != OMIT
        @additional_properties = additional_properties
        @_field_set = { "data": data, "meta": meta, "links": links }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of FilesDeleteResponse
      #
      # @param json_object [String]
      # @return [Ittybit::Files::FilesDeleteResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["data"].nil?
          data = nil
        else
          data = parsed_json["data"].to_json
          data = Ittybit::Files::FilesDeleteResponseData.from_json(json_object: data)
        end
        meta = parsed_json["meta"]
        if parsed_json["links"].nil?
          links = nil
        else
          links = parsed_json["links"].to_json
          links = Ittybit::Links.from_json(json_object: links)
        end
        new(
          data: data,
          meta: meta,
          links: links,
          additional_properties: struct
        )
      end

      # Serialize an instance of FilesDeleteResponse to a JSON object
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
        obj.data.nil? || Ittybit::Files::FilesDeleteResponseData.validate_raw(obj: obj.data)
        obj.meta&.is_a?(Object) != false || raise("Passed value for field obj.meta is not the expected type, validation failed.")
        obj.links.nil? || Ittybit::Links.validate_raw(obj: obj.links)
      end
    end
  end
end
