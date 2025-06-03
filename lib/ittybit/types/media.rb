# frozen_string_literal: true

require_relative "media_kind"
require_relative "media_source"
require_relative "media_urls"
require "date"
require "ostruct"
require "json"

module Ittybit
  class Media
    # @return [String] Unique identifier for the media item.
    attr_reader :id
    # @return [String] Object type, always 'media'.
    attr_reader :object
    # @return [Ittybit::MediaKind] The primary kind of the media, derived from the original file.
    attr_reader :kind
    # @return [String] Title of the media item.
    attr_reader :title
    # @return [String] Alternative text for the media item.
    attr_reader :alt
    # @return [Integer] Width of the primary source in pixels.
    attr_reader :width
    # @return [Integer] Height of the primary source in pixels.
    attr_reader :height
    # @return [Float] Duration of the primary source in seconds.
    attr_reader :duration
    # @return [Array<Ittybit::MediaSource>] Array of source files associated with this media item.
    attr_reader :files
    # @return [Ittybit::MediaUrls] URLs for the media item.
    attr_reader :urls
    # @return [String] URL of the poster image (video kinds only).
    attr_reader :poster
    # @return [String] Base64 encoded placeholder image (video/image only).
    attr_reader :placeholder
    # @return [String] Dominant background color hex code (video/image only).
    attr_reader :background
    # @return [Hash{String => Object}] User-defined key-value metadata for the media item.
    attr_reader :metadata
    # @return [DateTime] Timestamp when the media record was created.
    attr_reader :created
    # @return [DateTime] Timestamp when the media item was last updated.
    attr_reader :updated
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Unique identifier for the media item.
    # @param object [String] Object type, always 'media'.
    # @param kind [Ittybit::MediaKind] The primary kind of the media, derived from the original file.
    # @param title [String] Title of the media item.
    # @param alt [String] Alternative text for the media item.
    # @param width [Integer] Width of the primary source in pixels.
    # @param height [Integer] Height of the primary source in pixels.
    # @param duration [Float] Duration of the primary source in seconds.
    # @param files [Array<Ittybit::MediaSource>] Array of source files associated with this media item.
    # @param urls [Ittybit::MediaUrls] URLs for the media item.
    # @param poster [String] URL of the poster image (video kinds only).
    # @param placeholder [String] Base64 encoded placeholder image (video/image only).
    # @param background [String] Dominant background color hex code (video/image only).
    # @param metadata [Hash{String => Object}] User-defined key-value metadata for the media item.
    # @param created [DateTime] Timestamp when the media record was created.
    # @param updated [DateTime] Timestamp when the media item was last updated.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::Media]
    def initialize(id:, object:, kind:, files:, urls:, created:, updated:, title: OMIT, alt: OMIT, width: OMIT,
                   height: OMIT, duration: OMIT, poster: OMIT, placeholder: OMIT, background: OMIT, metadata: OMIT, additional_properties: nil)
      @id = id
      @object = object
      @kind = kind
      @title = title if title != OMIT
      @alt = alt if alt != OMIT
      @width = width if width != OMIT
      @height = height if height != OMIT
      @duration = duration if duration != OMIT
      @files = files
      @urls = urls
      @poster = poster if poster != OMIT
      @placeholder = placeholder if placeholder != OMIT
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
        "poster": poster,
        "placeholder": placeholder,
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
        Ittybit::MediaSource.from_json(json_object: item)
      end
      if parsed_json["urls"].nil?
        urls = nil
      else
        urls = parsed_json["urls"].to_json
        urls = Ittybit::MediaUrls.from_json(json_object: urls)
      end
      poster = parsed_json["poster"]
      placeholder = parsed_json["placeholder"]
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
        poster: poster,
        placeholder: placeholder,
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
      obj.kind.is_a?(Ittybit::MediaKind) != false || raise("Passed value for field obj.kind is not the expected type, validation failed.")
      obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      obj.alt&.is_a?(String) != false || raise("Passed value for field obj.alt is not the expected type, validation failed.")
      obj.width&.is_a?(Integer) != false || raise("Passed value for field obj.width is not the expected type, validation failed.")
      obj.height&.is_a?(Integer) != false || raise("Passed value for field obj.height is not the expected type, validation failed.")
      obj.duration&.is_a?(Float) != false || raise("Passed value for field obj.duration is not the expected type, validation failed.")
      obj.files.is_a?(Array) != false || raise("Passed value for field obj.files is not the expected type, validation failed.")
      Ittybit::MediaUrls.validate_raw(obj: obj.urls)
      obj.poster&.is_a?(String) != false || raise("Passed value for field obj.poster is not the expected type, validation failed.")
      obj.placeholder&.is_a?(String) != false || raise("Passed value for field obj.placeholder is not the expected type, validation failed.")
      obj.background&.is_a?(String) != false || raise("Passed value for field obj.background is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
      obj.created.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      obj.updated.is_a?(DateTime) != false || raise("Passed value for field obj.updated is not the expected type, validation failed.")
    end
  end
end
