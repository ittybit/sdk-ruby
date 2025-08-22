# frozen_string_literal: true

require_relative "files_list_response_item_object"
require_relative "files_list_response_item_kind"
require "date"
require_relative "files_list_response_item_status"
require "ostruct"
require "json"

module Ittybit
  class Files
    class FilesListResponseItem
      # @return [String]
      attr_reader :id
      # @return [String]
      attr_reader :media_id
      # @return [Ittybit::Files::FilesListResponseItemObject]
      attr_reader :object
      # @return [Ittybit::Files::FilesListResponseItemKind]
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
      # @return [String]
      attr_reader :orientation
      # @return [Float]
      attr_reader :rotation
      # @return [Boolean]
      attr_reader :transparency
      # @return [Boolean]
      attr_reader :animated
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
      attr_reader :language
      # @return [String]
      attr_reader :label
      # @return [String]
      attr_reader :ref
      # @return [String]
      attr_reader :folder
      # @return [String]
      attr_reader :filename
      # @return [String]
      attr_reader :url
      # @return [String]
      attr_reader :placeholder
      # @return [String]
      attr_reader :background
      # @return [Hash{String => Object}]
      attr_reader :metadata
      # @return [Boolean]
      attr_reader :original
      # @return [String]
      attr_reader :created_by
      # @return [DateTime]
      attr_reader :created
      # @return [DateTime]
      attr_reader :updated
      # @return [Ittybit::Files::FilesListResponseItemStatus]
      attr_reader :status
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param media_id [String]
      # @param object [Ittybit::Files::FilesListResponseItemObject]
      # @param kind [Ittybit::Files::FilesListResponseItemKind]
      # @param type [String]
      # @param codec [String]
      # @param container [String]
      # @param width [Integer]
      # @param height [Integer]
      # @param orientation [String]
      # @param rotation [Float]
      # @param transparency [Boolean]
      # @param animated [Boolean]
      # @param frames [Integer]
      # @param duration [Float]
      # @param fps [Float]
      # @param filesize [Integer]
      # @param bitrate [Integer]
      # @param language [String]
      # @param label [String]
      # @param ref [String]
      # @param folder [String]
      # @param filename [String]
      # @param url [String]
      # @param placeholder [String]
      # @param background [String]
      # @param metadata [Hash{String => Object}]
      # @param original [Boolean]
      # @param created_by [String]
      # @param created [DateTime]
      # @param updated [DateTime]
      # @param status [Ittybit::Files::FilesListResponseItemStatus]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ittybit::Files::FilesListResponseItem]
      def initialize(id:, media_id:, object:, kind:, type:, filesize:, url:, created:, updated:, status:, codec: OMIT, container: OMIT, width: OMIT, height: OMIT,
                     orientation: OMIT, rotation: OMIT, transparency: OMIT, animated: OMIT, frames: OMIT, duration: OMIT, fps: OMIT, bitrate: OMIT, language: OMIT, label: OMIT, ref: OMIT, folder: OMIT, filename: OMIT, placeholder: OMIT, background: OMIT, metadata: OMIT, original: OMIT, created_by: OMIT, additional_properties: nil)
        @id = id
        @media_id = media_id
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
        @animated = animated if animated != OMIT
        @frames = frames if frames != OMIT
        @duration = duration if duration != OMIT
        @fps = fps if fps != OMIT
        @filesize = filesize
        @bitrate = bitrate if bitrate != OMIT
        @language = language if language != OMIT
        @label = label if label != OMIT
        @ref = ref if ref != OMIT
        @folder = folder if folder != OMIT
        @filename = filename if filename != OMIT
        @url = url
        @placeholder = placeholder if placeholder != OMIT
        @background = background if background != OMIT
        @metadata = metadata if metadata != OMIT
        @original = original if original != OMIT
        @created_by = created_by if created_by != OMIT
        @created = created
        @updated = updated
        @status = status
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "media_id": media_id,
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
          "animated": animated,
          "frames": frames,
          "duration": duration,
          "fps": fps,
          "filesize": filesize,
          "bitrate": bitrate,
          "language": language,
          "label": label,
          "ref": ref,
          "folder": folder,
          "filename": filename,
          "url": url,
          "placeholder": placeholder,
          "background": background,
          "metadata": metadata,
          "original": original,
          "created_by": created_by,
          "created": created,
          "updated": updated,
          "status": status
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of FilesListResponseItem
      #
      # @param json_object [String]
      # @return [Ittybit::Files::FilesListResponseItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        media_id = parsed_json["media_id"]
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
        animated = parsed_json["animated"]
        frames = parsed_json["frames"]
        duration = parsed_json["duration"]
        fps = parsed_json["fps"]
        filesize = parsed_json["filesize"]
        bitrate = parsed_json["bitrate"]
        language = parsed_json["language"]
        label = parsed_json["label"]
        ref = parsed_json["ref"]
        folder = parsed_json["folder"]
        filename = parsed_json["filename"]
        url = parsed_json["url"]
        placeholder = parsed_json["placeholder"]
        background = parsed_json["background"]
        metadata = parsed_json["metadata"]
        original = parsed_json["original"]
        created_by = parsed_json["created_by"]
        created = (DateTime.parse(parsed_json["created"]) unless parsed_json["created"].nil?)
        updated = (DateTime.parse(parsed_json["updated"]) unless parsed_json["updated"].nil?)
        status = parsed_json["status"]
        new(
          id: id,
          media_id: media_id,
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
          animated: animated,
          frames: frames,
          duration: duration,
          fps: fps,
          filesize: filesize,
          bitrate: bitrate,
          language: language,
          label: label,
          ref: ref,
          folder: folder,
          filename: filename,
          url: url,
          placeholder: placeholder,
          background: background,
          metadata: metadata,
          original: original,
          created_by: created_by,
          created: created,
          updated: updated,
          status: status,
          additional_properties: struct
        )
      end

      # Serialize an instance of FilesListResponseItem to a JSON object
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
        obj.media_id.is_a?(String) != false || raise("Passed value for field obj.media_id is not the expected type, validation failed.")
        obj.object.is_a?(Ittybit::Files::FilesListResponseItemObject) != false || raise("Passed value for field obj.object is not the expected type, validation failed.")
        obj.kind.is_a?(Ittybit::Files::FilesListResponseItemKind) != false || raise("Passed value for field obj.kind is not the expected type, validation failed.")
        obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.codec&.is_a?(String) != false || raise("Passed value for field obj.codec is not the expected type, validation failed.")
        obj.container&.is_a?(String) != false || raise("Passed value for field obj.container is not the expected type, validation failed.")
        obj.width&.is_a?(Integer) != false || raise("Passed value for field obj.width is not the expected type, validation failed.")
        obj.height&.is_a?(Integer) != false || raise("Passed value for field obj.height is not the expected type, validation failed.")
        obj.orientation&.is_a?(String) != false || raise("Passed value for field obj.orientation is not the expected type, validation failed.")
        obj.rotation&.is_a?(Float) != false || raise("Passed value for field obj.rotation is not the expected type, validation failed.")
        obj.transparency&.is_a?(Boolean) != false || raise("Passed value for field obj.transparency is not the expected type, validation failed.")
        obj.animated&.is_a?(Boolean) != false || raise("Passed value for field obj.animated is not the expected type, validation failed.")
        obj.frames&.is_a?(Integer) != false || raise("Passed value for field obj.frames is not the expected type, validation failed.")
        obj.duration&.is_a?(Float) != false || raise("Passed value for field obj.duration is not the expected type, validation failed.")
        obj.fps&.is_a?(Float) != false || raise("Passed value for field obj.fps is not the expected type, validation failed.")
        obj.filesize.is_a?(Integer) != false || raise("Passed value for field obj.filesize is not the expected type, validation failed.")
        obj.bitrate&.is_a?(Integer) != false || raise("Passed value for field obj.bitrate is not the expected type, validation failed.")
        obj.language&.is_a?(String) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
        obj.label&.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
        obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
        obj.folder&.is_a?(String) != false || raise("Passed value for field obj.folder is not the expected type, validation failed.")
        obj.filename&.is_a?(String) != false || raise("Passed value for field obj.filename is not the expected type, validation failed.")
        obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
        obj.placeholder&.is_a?(String) != false || raise("Passed value for field obj.placeholder is not the expected type, validation failed.")
        obj.background&.is_a?(String) != false || raise("Passed value for field obj.background is not the expected type, validation failed.")
        obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
        obj.original&.is_a?(Boolean) != false || raise("Passed value for field obj.original is not the expected type, validation failed.")
        obj.created_by&.is_a?(String) != false || raise("Passed value for field obj.created_by is not the expected type, validation failed.")
        obj.created.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
        obj.updated.is_a?(DateTime) != false || raise("Passed value for field obj.updated is not the expected type, validation failed.")
        obj.status.is_a?(Ittybit::Files::FilesListResponseItemStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      end
    end
  end
end
