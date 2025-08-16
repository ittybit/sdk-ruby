# frozen_string_literal: true

require_relative "media_kind"
require_relative "media_files_item"
require "date"
require "ostruct"
require "json"

module Ittybit
  class Media
    # @return [String]
    attr_reader :id
    # @return [String]
    attr_reader :object
    # @return [Ittybit::MediaKind]
    attr_reader :kind
    # @return [String]
    attr_reader :title
    # @return [String]
    attr_reader :alt
    # @return [Integer]
    attr_reader :width
    # @return [Integer]
    attr_reader :height
    # @return [Float]
    attr_reader :duration
    # @return [Array<Ittybit::MediaFilesItem>]
    attr_reader :files
    # @return [Hash{String => Object}]
    attr_reader :urls
    # @return [String]
    attr_reader :background
    # @return [Hash{String => Object}]
    attr_reader :metadata
    # @return [DateTime]
    attr_reader :created
    # @return [DateTime]
    attr_reader :updated
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String]
    # @param object [String]
    # @param kind [Ittybit::MediaKind]
    # @param title [String]
    # @param alt [String]
    # @param width [Integer]
    # @param height [Integer]
    # @param duration [Float]
    # @param files [Array<Ittybit::MediaFilesItem>]
    # @param urls [Hash{String => Object}]
    # @param background [String]
    # @param metadata [Hash{String => Object}]
    # @param created [DateTime]
    # @param updated [DateTime]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::Media]
    def initialize(id:, object:, files:, urls:, created:, updated:, kind: OMIT, title: OMIT, alt: OMIT, width: OMIT,
                   height: OMIT, duration: OMIT, background: OMIT, metadata: OMIT, additional_properties: nil)
      @id = id
      @object = object
      @kind = kind if kind != OMIT
      @title = title if title != OMIT
      @alt = alt if alt != OMIT
      @width = width if width != OMIT
      @height = height if height != OMIT
      @duration = duration if duration != OMIT
      @files = files
      @urls = urls
      @background = background if background != OMIT
      @metadata = metadata if metadata != OMIT
      @created = created
      @updated = updated
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "object": object,
        "kind": kind,
        "title": title,
        "alt": alt,
        "width": width,
        "height": height,
        "duration": duration,
        "files": files,
        "urls": urls,
        "background": background,
        "metadata": metadata,
        "created": created,
        "updated": updated
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Media
    #
    # @param json_object [String]
    # @return [Ittybit::Media]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      object = parsed_json["object"]
      kind = parsed_json["kind"]
      title = parsed_json["title"]
      alt = parsed_json["alt"]
      width = parsed_json["width"]
      height = parsed_json["height"]
      duration = parsed_json["duration"]
      files = parsed_json["files"]&.map do |item|
        item = item.to_json
        Ittybit::MediaFilesItem.from_json(json_object: item)
      end
      urls = parsed_json["urls"]
      background = parsed_json["background"]
      metadata = parsed_json["metadata"]
      created = (DateTime.parse(parsed_json["created"]) unless parsed_json["created"].nil?)
      updated = (DateTime.parse(parsed_json["updated"]) unless parsed_json["updated"].nil?)
      new(
        id: id,
        object: object,
        kind: kind,
        title: title,
        alt: alt,
        width: width,
        height: height,
        duration: duration,
        files: files,
        urls: urls,
        background: background,
        metadata: metadata,
        created: created,
        updated: updated,
        additional_properties: struct
      )
    end

    # Serialize an instance of Media to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.object.is_a?(String) != false || raise("Passed value for field obj.object is not the expected type, validation failed.")
      obj.kind&.is_a?(Ittybit::MediaKind) != false || raise("Passed value for field obj.kind is not the expected type, validation failed.")
      obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      obj.alt&.is_a?(String) != false || raise("Passed value for field obj.alt is not the expected type, validation failed.")
      obj.width&.is_a?(Integer) != false || raise("Passed value for field obj.width is not the expected type, validation failed.")
      obj.height&.is_a?(Integer) != false || raise("Passed value for field obj.height is not the expected type, validation failed.")
      obj.duration&.is_a?(Float) != false || raise("Passed value for field obj.duration is not the expected type, validation failed.")
      obj.files.is_a?(Array) != false || raise("Passed value for field obj.files is not the expected type, validation failed.")
      obj.urls.is_a?(Hash) != false || raise("Passed value for field obj.urls is not the expected type, validation failed.")
      obj.background&.is_a?(String) != false || raise("Passed value for field obj.background is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
      obj.created.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      obj.updated.is_a?(DateTime) != false || raise("Passed value for field obj.updated is not the expected type, validation failed.")
    end
  end
end
