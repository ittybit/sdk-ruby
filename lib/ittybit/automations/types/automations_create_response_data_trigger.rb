# frozen_string_literal: true

require "ostruct"
require "json"

module Ittybit
  class Automations
    class AutomationsCreateResponseDataTrigger
      # @return [String]
      attr_reader :kind
      # @return [String]
      attr_reader :event
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param kind [String]
      # @param event [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ittybit::Automations::AutomationsCreateResponseDataTrigger]
      def initialize(kind:, event:, additional_properties: nil)
        @kind = kind
        @event = event
        @additional_properties = additional_properties
        @_field_set = { "kind": kind, "event": event }
      end

      # Deserialize a JSON object to an instance of AutomationsCreateResponseDataTrigger
      #
      # @param json_object [String]
      # @return [Ittybit::Automations::AutomationsCreateResponseDataTrigger]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        kind = parsed_json["kind"]
        event = parsed_json["event"]
        new(
          kind: kind,
          event: event,
          additional_properties: struct
        )
      end

      # Serialize an instance of AutomationsCreateResponseDataTrigger to a JSON object
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
        obj.kind.is_a?(String) != false || raise("Passed value for field obj.kind is not the expected type, validation failed.")
        obj.event.is_a?(String) != false || raise("Passed value for field obj.event is not the expected type, validation failed.")
      end
    end
  end
end
