# frozen_string_literal: true

require_relative "meta_list"
require_relative "media"
require_relative "links_list"
require "ostruct"
require "json"

module Ittybit
  class MediaListResponse
    # @return [Ittybit::MetaList]
    attr_reader :meta
    # @return [Array<Ittybit::Media>]
    attr_reader :data
    # @return [Ittybit::LinksList]
    attr_reader :links
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param meta [Ittybit::MetaList]
    # @param data [Array<Ittybit::Media>]
    # @param links [Ittybit::LinksList]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::MediaListResponse]
    def initialize(meta: OMIT, data: OMIT, links: OMIT, additional_properties: nil)
      @meta = meta if meta != OMIT
      @data = data if data != OMIT
      @links = links if links != OMIT
      @additional_properties = additional_properties
      @_field_set = { "meta": meta, "data": data, "links": links }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of MediaListResponse
    #
    # @param json_object [String]
    # @return [Ittybit::MediaListResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["meta"].nil?
        meta = nil
      else
        meta = parsed_json["meta"].to_json
        meta = Ittybit::MetaList.from_json(json_object: meta)
      end
      data = parsed_json["data"]&.map do |item|
        item = item.to_json
        Ittybit::Media.from_json(json_object: item)
      end
      if parsed_json["links"].nil?
        links = nil
      else
        links = parsed_json["links"].to_json
        links = Ittybit::LinksList.from_json(json_object: links)
      end
      new(
        meta: meta,
        data: data,
        links: links,
        additional_properties: struct
      )
    end

    # Serialize an instance of MediaListResponse to a JSON object
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
      obj.meta.nil? || Ittybit::MetaList.validate_raw(obj: obj.meta)
      obj.data&.is_a?(Array) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
      obj.links.nil? || Ittybit::LinksList.validate_raw(obj: obj.links)
    end
  end
end
