# frozen_string_literal: true

require_relative "media_response_files_item_object"
require_relative "media_response_files_item_kind"
require_relative "media_response_files_item_orientation"
require "date"
require_relative "media_response_files_item_status"
require "ostruct"
require "json"

module Ittybit
  class MediaResponseFilesItem
    # @return [String]
    attr_reader :id
    # @return [Ittybit::MediaResponseFilesItemObject]
    attr_reader :object
    # @return [Ittybit::MediaResponseFilesItemKind]
    attr_reader :kind
    # @return [String]
    attr_reader :type
    # @return [String]
    attr_reader :codec
    # @return [String]
    attr_reader :container
    # @return [Integer]
    attr_reader :width
    # @return [Integer]
    attr_reader :height
    # @return [Ittybit::MediaResponseFilesItemOrientation]
    attr_reader :orientation
    # @return [Float]
    attr_reader :rotation
    # @return [Boolean]
    attr_reader :transparency
    # @return [Integer]
    attr_reader :frames
    # @return [Float]
    attr_reader :duration
    # @return [Float]
    attr_reader :fps
    # @return [Integer]
    attr_reader :filesize
    # @return [Integer]
    attr_reader :bitrate
    # @return [String]
    attr_reader :ref
    # @return [String]
    attr_reader :folder
    # @return [String]
    attr_reader :filename
    # @return [String]
    attr_reader :url
    # @return [Hash{String => Object}]
    attr_reader :metadata
    # @return [Boolean]
    attr_reader :original
    # @return [DateTime]
    attr_reader :created
    # @return [DateTime]
    attr_reader :updated
    # @return [Ittybit::MediaResponseFilesItemStatus]
    attr_reader :status
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String]
    # @param object [Ittybit::MediaResponseFilesItemObject]
    # @param kind [Ittybit::MediaResponseFilesItemKind]
    # @param type [String]
    # @param codec [String]
    # @param container [String]
    # @param width [Integer]
    # @param height [Integer]
    # @param orientation [Ittybit::MediaResponseFilesItemOrientation]
    # @param rotation [Float]
    # @param transparency [Boolean]
    # @param frames [Integer]
    # @param duration [Float]
    # @param fps [Float]
    # @param filesize [Integer]
    # @param bitrate [Integer]
    # @param ref [String]
    # @param folder [String]
    # @param filename [String]
    # @param url [String]
    # @param metadata [Hash{String => Object}]
    # @param original [Boolean]
    # @param created [DateTime]
    # @param updated [DateTime]
    # @param status [Ittybit::MediaResponseFilesItemStatus]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::MediaResponseFilesItem]
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

    # Deserialize a JSON object to an instance of MediaResponseFilesItem
    #
    # @param json_object [String]
    # @return [Ittybit::MediaResponseFilesItem]
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

    # Serialize an instance of MediaResponseFilesItem to a JSON object
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
      obj.object.is_a?(Ittybit::MediaResponseFilesItemObject) != false || raise("Passed value for field obj.object is not the expected type, validation failed.")
      obj.kind.is_a?(Ittybit::MediaResponseFilesItemKind) != false || raise("Passed value for field obj.kind is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.codec&.is_a?(String) != false || raise("Passed value for field obj.codec is not the expected type, validation failed.")
      obj.container&.is_a?(String) != false || raise("Passed value for field obj.container is not the expected type, validation failed.")
      obj.width&.is_a?(Integer) != false || raise("Passed value for field obj.width is not the expected type, validation failed.")
      obj.height&.is_a?(Integer) != false || raise("Passed value for field obj.height is not the expected type, validation failed.")
      obj.orientation&.is_a?(Ittybit::MediaResponseFilesItemOrientation) != false || raise("Passed value for field obj.orientation is not the expected type, validation failed.")
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
      obj.status.is_a?(Ittybit::MediaResponseFilesItemStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end
