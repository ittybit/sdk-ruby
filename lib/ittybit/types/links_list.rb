# frozen_string_literal: true

require "ostruct"
require "json"

module Ittybit
  class LinksList
    # @return [String] The absolute URL of the current request, potentially including query parameters.
    attr_reader :self_
    # @return [String] URL for the next page of results.
    attr_reader :next_
    # @return [String] URL for the previous page of results.
    attr_reader :prev
    # @return [String] URL for the parent resource.
    attr_reader :parent
    # @return [String] URL for the first page of results.
    attr_reader :first
    # @return [String] URL for the last page of results.
    attr_reader :last
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param self_ [String] The absolute URL of the current request, potentially including query parameters.
    # @param next_ [String] URL for the next page of results.
    # @param prev [String] URL for the previous page of results.
    # @param parent [String] URL for the parent resource.
    # @param first [String] URL for the first page of results.
    # @param last [String] URL for the last page of results.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::LinksList]
    def initialize(self_: OMIT, next_: OMIT, prev: OMIT, parent: OMIT, first: OMIT, last: OMIT,
                   additional_properties: nil)
      @self_ = self_ if self_ != OMIT
      @next_ = next_ if next_ != OMIT
      @prev = prev if prev != OMIT
      @parent = parent if parent != OMIT
      @first = first if first != OMIT
      @last = last if last != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "self": self_,
        "next": next_,
        "prev": prev,
        "parent": parent,
        "first": first,
        "last": last
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of LinksList
    #
    # @param json_object [String]
    # @return [Ittybit::LinksList]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      self_ = parsed_json["self"]
      next_ = parsed_json["next"]
      prev = parsed_json["prev"]
      parent = parsed_json["parent"]
      first = parsed_json["first"]
      last = parsed_json["last"]
      new(
        self_: self_,
        next_: next_,
        prev: prev,
        parent: parent,
        first: first,
        last: last,
        additional_properties: struct
      )
    end

    # Serialize an instance of LinksList to a JSON object
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
      obj.next_&.is_a?(String) != false || raise("Passed value for field obj.next_ is not the expected type, validation failed.")
      obj.prev&.is_a?(String) != false || raise("Passed value for field obj.prev is not the expected type, validation failed.")
      obj.parent&.is_a?(String) != false || raise("Passed value for field obj.parent is not the expected type, validation failed.")
      obj.first&.is_a?(String) != false || raise("Passed value for field obj.first is not the expected type, validation failed.")
      obj.last&.is_a?(String) != false || raise("Passed value for field obj.last is not the expected type, validation failed.")
    end
  end
end
