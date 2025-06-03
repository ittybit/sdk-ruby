# frozen_string_literal: true

require_relative "media_source_object"
require_relative "media_source_kind"
require "date"
require_relative "media_source_status"
require "ostruct"
require "json"

module Ittybit
  class MediaSource
    # @return [String] Unique identifier for the file.
    attr_reader :id
    # @return [Ittybit::MediaSourceObject] Object type
    attr_reader :object
    # @return [Ittybit::MediaSourceKind] The general type of media.
    attr_reader :kind
    # @return [String] MIME type.
    attr_reader :type
    # @return [String] Codec of the file.
    attr_reader :codec
    # @return [String] Container of the file.
    attr_reader :container
    # @return [Integer] Width in pixels (for image/video).
    attr_reader :width
    # @return [Integer] Height in pixels (for image/video).
    attr_reader :height
    # @return [String] Orientation of the file.
    attr_reader :orientation
    # @return [Float] Rotation value for image files with embedded EXIF data.
    attr_reader :rotation
    # @return [Boolean] Indicates if the file has alpha channel.
    attr_reader :transparency
    # @return [Integer] Number of frames in the file.
    attr_reader :frames
    # @return [Float] Duration in seconds (for audio/video).
    attr_reader :duration
    # @return [Float] Frames per second (for video).
    attr_reader :fps
    # @return [Integer] File size in bytes.
    attr_reader :filesize
    # @return [Integer] Bitrate for audio/video files.
    attr_reader :bitrate
    # @return [String] Optional reference value. If set, the file URL will be included in the parent
    #  media `urls` object.
    attr_reader :ref
    # @return [String] The folder path where the file is stored.
    attr_reader :folder
    # @return [String] The name of the file.
    attr_reader :filename
    # @return [String] Publicly accessible URL for the file.
    attr_reader :url
    # @return [Hash{String => Object}] User-defined key-value metadata.
    attr_reader :metadata
    # @return [Boolean] Indicates this is the original file rather than a variant.
    attr_reader :original
    # @return [DateTime] Timestamp when the file record was created.
    attr_reader :created
    # @return [DateTime] Timestamp when the file record was last updated.
    attr_reader :updated
    # @return [Ittybit::MediaSourceStatus] Processing status of the file.
    attr_reader :status
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Unique identifier for the file.
    # @param object [Ittybit::MediaSourceObject] Object type
    # @param kind [Ittybit::MediaSourceKind] The general type of media.
    # @param type [String] MIME type.
    # @param codec [String] Codec of the file.
    # @param container [String] Container of the file.
    # @param width [Integer] Width in pixels (for image/video).
    # @param height [Integer] Height in pixels (for image/video).
    # @param orientation [String] Orientation of the file.
    # @param rotation [Float] Rotation value for image files with embedded EXIF data.
    # @param transparency [Boolean] Indicates if the file has alpha channel.
    # @param frames [Integer] Number of frames in the file.
    # @param duration [Float] Duration in seconds (for audio/video).
    # @param fps [Float] Frames per second (for video).
    # @param filesize [Integer] File size in bytes.
    # @param bitrate [Integer] Bitrate for audio/video files.
    # @param ref [String] Optional reference value. If set, the file URL will be included in the parent
    #  media `urls` object.
    # @param folder [String] The folder path where the file is stored.
    # @param filename [String] The name of the file.
    # @param url [String] Publicly accessible URL for the file.
    # @param metadata [Hash{String => Object}] User-defined key-value metadata.
    # @param original [Boolean] Indicates this is the original file rather than a variant.
    # @param created [DateTime] Timestamp when the file record was created.
    # @param updated [DateTime] Timestamp when the file record was last updated.
    # @param status [Ittybit::MediaSourceStatus] Processing status of the file.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::MediaSource]
    def initialize(id:, object:, kind:, type:, filesize:, url:, created:, updated:, status:, codec: OMIT, container: OMIT, width: OMIT, height: OMIT,
                   orientation: OMIT, rotation: OMIT, transparency: OMIT, frames: OMIT, duration: OMIT, fps: OMIT, bitrate: OMIT, ref: OMIT, folder: OMIT, filename: OMIT, metadata: OMIT, original: OMIT, additional_properties: nil)
      @id = id
      @object = object
      @kind = kind
      @type = type
      @codec = codec if codec != OMIT
      @container = container if container != OMIT
      @width = width if width != OMIT
      @height = height if height != OMIT
      @orientation = orientation if orientation != OMIT
      @rotation = rotation if rotation != OMIT
      @transparency = transparency if transparency != OMIT
      @frames = frames if frames != OMIT
      @duration = duration if duration != OMIT
      @fps = fps if fps != OMIT
      @filesize = filesize
      @bitrate = bitrate if bitrate != OMIT
      @ref = ref if ref != OMIT
      @folder = folder if folder != OMIT
      @filename = filename if filename != OMIT
      @url = url
      @metadata = metadata if metadata != OMIT
      @original = original if original != OMIT
      @created = created
      @updated = updated
      @status = status
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "object": object,
        "kind": kind,
        "type": type,
        "codec": codec,
        "container": container,
        "width": width,
        "height": height,
        "orientation": orientation,
        "rotation": rotation,
        "transparency": transparency,
        "frames": frames,
        "duration": duration,
        "fps": fps,
        "filesize": filesize,
        "bitrate": bitrate,
        "ref": ref,
        "folder": folder,
        "filename": filename,
        "url": url,
        "metadata": metadata,
        "original": original,
        "created": created,
        "updated": updated,
        "status": status
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of MediaSource
    #
    # @param json_object [String]
    # @return [Ittybit::MediaSource]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      object = parsed_json["object"]
      kind = parsed_json["kind"]
      type = parsed_json["type"]
      codec = parsed_json["codec"]
      container = parsed_json["container"]
      width = parsed_json["width"]
      height = parsed_json["height"]
      orientation = parsed_json["orientation"]
      rotation = parsed_json["rotation"]
      transparency = parsed_json["transparency"]
      frames = parsed_json["frames"]
      duration = parsed_json["duration"]
      fps = parsed_json["fps"]
      filesize = parsed_json["filesize"]
      bitrate = parsed_json["bitrate"]
      ref = parsed_json["ref"]
      folder = parsed_json["folder"]
      filename = parsed_json["filename"]
      url = parsed_json["url"]
      metadata = parsed_json["metadata"]
      original = parsed_json["original"]
      created = (DateTime.parse(parsed_json["created"]) unless parsed_json["created"].nil?)
      updated = (DateTime.parse(parsed_json["updated"]) unless parsed_json["updated"].nil?)
      status = parsed_json["status"]
      new(
        id: id,
        object: object,
        kind: kind,
        type: type,
        codec: codec,
        container: container,
        width: width,
        height: height,
        orientation: orientation,
        rotation: rotation,
        transparency: transparency,
        frames: frames,
        duration: duration,
        fps: fps,
        filesize: filesize,
        bitrate: bitrate,
        ref: ref,
        folder: folder,
        filename: filename,
        url: url,
        metadata: metadata,
        original: original,
        created: created,
        updated: updated,
        status: status,
        additional_properties: struct
      )
    end

    # Serialize an instance of MediaSource to a JSON object
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
      obj.object.is_a?(Ittybit::MediaSourceObject) != false || raise("Passed value for field obj.object is not the expected type, validation failed.")
      obj.kind.is_a?(Ittybit::MediaSourceKind) != false || raise("Passed value for field obj.kind is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.codec&.is_a?(String) != false || raise("Passed value for field obj.codec is not the expected type, validation failed.")
      obj.container&.is_a?(String) != false || raise("Passed value for field obj.container is not the expected type, validation failed.")
      obj.width&.is_a?(Integer) != false || raise("Passed value for field obj.width is not the expected type, validation failed.")
      obj.height&.is_a?(Integer) != false || raise("Passed value for field obj.height is not the expected type, validation failed.")
      obj.orientation&.is_a?(String) != false || raise("Passed value for field obj.orientation is not the expected type, validation failed.")
      obj.rotation&.is_a?(Float) != false || raise("Passed value for field obj.rotation is not the expected type, validation failed.")
      obj.transparency&.is_a?(Boolean) != false || raise("Passed value for field obj.transparency is not the expected type, validation failed.")
      obj.frames&.is_a?(Integer) != false || raise("Passed value for field obj.frames is not the expected type, validation failed.")
      obj.duration&.is_a?(Float) != false || raise("Passed value for field obj.duration is not the expected type, validation failed.")
      obj.fps&.is_a?(Float) != false || raise("Passed value for field obj.fps is not the expected type, validation failed.")
      obj.filesize.is_a?(Integer) != false || raise("Passed value for field obj.filesize is not the expected type, validation failed.")
      obj.bitrate&.is_a?(Integer) != false || raise("Passed value for field obj.bitrate is not the expected type, validation failed.")
      obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
      obj.folder&.is_a?(String) != false || raise("Passed value for field obj.folder is not the expected type, validation failed.")
      obj.filename&.is_a?(String) != false || raise("Passed value for field obj.filename is not the expected type, validation failed.")
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
      obj.original&.is_a?(Boolean) != false || raise("Passed value for field obj.original is not the expected type, validation failed.")
      obj.created.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      obj.updated.is_a?(DateTime) != false || raise("Passed value for field obj.updated is not the expected type, validation failed.")
      obj.status.is_a?(Ittybit::MediaSourceStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end
