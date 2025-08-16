# frozen_string_literal: true

require "ostruct"
require "json"

module Ittybit
  class Media
    class MediaUpdateResponseLinks
      # @return [String]
      attr_reader :self_
      # @return [String]
      attr_reader :parent
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param self_ [String]
      # @param parent [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ittybit::Media::MediaUpdateResponseLinks]
      def initialize(self_: OMIT, parent: OMIT, additional_properties: nil)
        @self_ = self_ if self_ != OMIT
        @parent = parent if parent != OMIT
        @additional_properties = additional_properties
        @_field_set = { "self": self_, "parent": parent }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of MediaUpdateResponseLinks
      #
      # @param json_object [String]
      # @return [Ittybit::Media::MediaUpdateResponseLinks]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        self_ = parsed_json["self"]
        parent = parsed_json["parent"]
        new(
          self_: self_,
          parent: parent,
          additional_properties: struct
        )
      end

      # Serialize an instance of MediaUpdateResponseLinks to a JSON object
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
        obj.self_&.is_a?(String) != false || raise("Passed value for field obj.self_ is not the expected type, validation failed.")
        obj.parent&.is_a?(String) != false || raise("Passed value for field obj.parent is not the expected type, validation failed.")
      end
    end
  end
end
