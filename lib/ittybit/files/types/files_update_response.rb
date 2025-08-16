# frozen_string_literal: true

require_relative "files_update_response_meta"
require_relative "files_update_response_data"
require_relative "files_update_response_error"
require_relative "files_update_response_links"
require "ostruct"
require "json"

module Ittybit
  class Files
    class FilesUpdateResponse
      # @return [Ittybit::Files::FilesUpdateResponseMeta]
      attr_reader :meta
      # @return [Ittybit::Files::FilesUpdateResponseData]
      attr_reader :data
      # @return [Ittybit::Files::FilesUpdateResponseError]
      attr_reader :error
      # @return [Ittybit::Files::FilesUpdateResponseLinks]
      attr_reader :links
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param meta [Ittybit::Files::FilesUpdateResponseMeta]
      # @param data [Ittybit::Files::FilesUpdateResponseData]
      # @param error [Ittybit::Files::FilesUpdateResponseError]
      # @param links [Ittybit::Files::FilesUpdateResponseLinks]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ittybit::Files::FilesUpdateResponse]
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

      # Deserialize a JSON object to an instance of FilesUpdateResponse
      #
      # @param json_object [String]
      # @return [Ittybit::Files::FilesUpdateResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["meta"].nil?
          meta = nil
        else
          meta = parsed_json["meta"].to_json
          meta = Ittybit::Files::FilesUpdateResponseMeta.from_json(json_object: meta)
        end
        if parsed_json["data"].nil?
          data = nil
        else
          data = parsed_json["data"].to_json
          data = Ittybit::Files::FilesUpdateResponseData.from_json(json_object: data)
        end
        if parsed_json["error"].nil?
          error = nil
        else
          error = parsed_json["error"].to_json
          error = Ittybit::Files::FilesUpdateResponseError.from_json(json_object: error)
        end
        if parsed_json["links"].nil?
          links = nil
        else
          links = parsed_json["links"].to_json
          links = Ittybit::Files::FilesUpdateResponseLinks.from_json(json_object: links)
        end
        new(
          meta: meta,
          data: data,
          error: error,
          links: links,
          additional_properties: struct
        )
      end

      # Serialize an instance of FilesUpdateResponse to a JSON object
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
        obj.meta.nil? || Ittybit::Files::FilesUpdateResponseMeta.validate_raw(obj: obj.meta)
        obj.data.nil? || Ittybit::Files::FilesUpdateResponseData.validate_raw(obj: obj.data)
        obj.error.nil? || Ittybit::Files::FilesUpdateResponseError.validate_raw(obj: obj.error)
        obj.links.nil? || Ittybit::Files::FilesUpdateResponseLinks.validate_raw(obj: obj.links)
      end
    end
  end
end
