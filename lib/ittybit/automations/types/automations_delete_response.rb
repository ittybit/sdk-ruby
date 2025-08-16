# frozen_string_literal: true

require_relative "automations_delete_response_meta"
require_relative "automations_delete_response_data"
require_relative "automations_delete_response_error"
require_relative "automations_delete_response_links"
require "ostruct"
require "json"

module Ittybit
  class Automations
    class AutomationsDeleteResponse
      # @return [Ittybit::Automations::AutomationsDeleteResponseMeta]
      attr_reader :meta
      # @return [Ittybit::Automations::AutomationsDeleteResponseData]
      attr_reader :data
      # @return [Ittybit::Automations::AutomationsDeleteResponseError]
      attr_reader :error
      # @return [Ittybit::Automations::AutomationsDeleteResponseLinks]
      attr_reader :links
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param meta [Ittybit::Automations::AutomationsDeleteResponseMeta]
      # @param data [Ittybit::Automations::AutomationsDeleteResponseData]
      # @param error [Ittybit::Automations::AutomationsDeleteResponseError]
      # @param links [Ittybit::Automations::AutomationsDeleteResponseLinks]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ittybit::Automations::AutomationsDeleteResponse]
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

      # Deserialize a JSON object to an instance of AutomationsDeleteResponse
      #
      # @param json_object [String]
      # @return [Ittybit::Automations::AutomationsDeleteResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["meta"].nil?
          meta = nil
        else
          meta = parsed_json["meta"].to_json
          meta = Ittybit::Automations::AutomationsDeleteResponseMeta.from_json(json_object: meta)
        end
        if parsed_json["data"].nil?
          data = nil
        else
          data = parsed_json["data"].to_json
          data = Ittybit::Automations::AutomationsDeleteResponseData.from_json(json_object: data)
        end
        if parsed_json["error"].nil?
          error = nil
        else
          error = parsed_json["error"].to_json
          error = Ittybit::Automations::AutomationsDeleteResponseError.from_json(json_object: error)
        end
        if parsed_json["links"].nil?
          links = nil
        else
          links = parsed_json["links"].to_json
          links = Ittybit::Automations::AutomationsDeleteResponseLinks.from_json(json_object: links)
        end
        new(
          meta: meta,
          data: data,
          error: error,
          links: links,
          additional_properties: struct
        )
      end

      # Serialize an instance of AutomationsDeleteResponse to a JSON object
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
        obj.meta.nil? || Ittybit::Automations::AutomationsDeleteResponseMeta.validate_raw(obj: obj.meta)
        obj.data.nil? || Ittybit::Automations::AutomationsDeleteResponseData.validate_raw(obj: obj.data)
        obj.error.nil? || Ittybit::Automations::AutomationsDeleteResponseError.validate_raw(obj: obj.error)
        obj.links.nil? || Ittybit::Automations::AutomationsDeleteResponseLinks.validate_raw(obj: obj.links)
      end
    end
  end
end
