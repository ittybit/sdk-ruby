# frozen_string_literal: true

require "ostruct"
require "json"

module Ittybit
  class Tasks
    class TasksListResponseLinks
      # @return [String]
      attr_reader :self_
      # @return [String]
      attr_reader :first
      # @return [String]
      attr_reader :next_
      # @return [String]
      attr_reader :prev
      # @return [String]
      attr_reader :last
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param self_ [String]
      # @param first [String]
      # @param next_ [String]
      # @param prev [String]
      # @param last [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ittybit::Tasks::TasksListResponseLinks]
      def initialize(self_: OMIT, first: OMIT, next_: OMIT, prev: OMIT, last: OMIT, additional_properties: nil)
        @self_ = self_ if self_ != OMIT
        @first = first if first != OMIT
        @next_ = next_ if next_ != OMIT
        @prev = prev if prev != OMIT
        @last = last if last != OMIT
        @additional_properties = additional_properties
        @_field_set = { "self": self_, "first": first, "next": next_, "prev": prev, "last": last }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of TasksListResponseLinks
      #
      # @param json_object [String]
      # @return [Ittybit::Tasks::TasksListResponseLinks]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        self_ = parsed_json["self"]
        first = parsed_json["first"]
        next_ = parsed_json["next"]
        prev = parsed_json["prev"]
        last = parsed_json["last"]
        new(
          self_: self_,
          first: first,
          next_: next_,
          prev: prev,
          last: last,
          additional_properties: struct
        )
      end

      # Serialize an instance of TasksListResponseLinks to a JSON object
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
        obj.first&.is_a?(String) != false || raise("Passed value for field obj.first is not the expected type, validation failed.")
        obj.next_&.is_a?(String) != false || raise("Passed value for field obj.next_ is not the expected type, validation failed.")
        obj.prev&.is_a?(String) != false || raise("Passed value for field obj.prev is not the expected type, validation failed.")
        obj.last&.is_a?(String) != false || raise("Passed value for field obj.last is not the expected type, validation failed.")
      end
    end
  end
end
