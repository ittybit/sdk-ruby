# frozen_string_literal: true

require_relative "workflow_task_step_kind"
require "ostruct"
require "json"

module Ittybit
  class WorkflowTaskStep
    # @return [Ittybit::WorkflowTaskStepKind] The type of operation the task performs.
    attr_reader :kind
    # @return [String] Optional label for the output of this step.
    attr_reader :label
    # @return [String] Output format (e.g., mp4, jpg)
    attr_reader :format
    # @return [Integer] Output width
    attr_reader :width
    # @return [Integer] Output height
    attr_reader :height
    # @return [String] Resize mode
    attr_reader :resize
    # @return [Integer] Quality setting
    attr_reader :quality
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param kind [Ittybit::WorkflowTaskStepKind] The type of operation the task performs.
    # @param label [String] Optional label for the output of this step.
    # @param format [String] Output format (e.g., mp4, jpg)
    # @param width [Integer] Output width
    # @param height [Integer] Output height
    # @param resize [String] Resize mode
    # @param quality [Integer] Quality setting
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::WorkflowTaskStep]
    def initialize(kind:, label: OMIT, format: OMIT, width: OMIT, height: OMIT, resize: OMIT, quality: OMIT,
                   additional_properties: nil)
      @kind = kind
      @label = label if label != OMIT
      @format = format if format != OMIT
      @width = width if width != OMIT
      @height = height if height != OMIT
      @resize = resize if resize != OMIT
      @quality = quality if quality != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "kind": kind,
        "label": label,
        "format": format,
        "width": width,
        "height": height,
        "resize": resize,
        "quality": quality
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of WorkflowTaskStep
    #
    # @param json_object [String]
    # @return [Ittybit::WorkflowTaskStep]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      kind = parsed_json["kind"]
      label = parsed_json["label"]
      format = parsed_json["format"]
      width = parsed_json["width"]
      height = parsed_json["height"]
      resize = parsed_json["resize"]
      quality = parsed_json["quality"]
      new(
        kind: kind,
        label: label,
        format: format,
        width: width,
        height: height,
        resize: resize,
        quality: quality,
        additional_properties: struct
      )
    end

    # Serialize an instance of WorkflowTaskStep to a JSON object
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
      obj.kind.is_a?(Ittybit::WorkflowTaskStepKind) != false || raise("Passed value for field obj.kind is not the expected type, validation failed.")
      obj.label&.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.format&.is_a?(String) != false || raise("Passed value for field obj.format is not the expected type, validation failed.")
      obj.width&.is_a?(Integer) != false || raise("Passed value for field obj.width is not the expected type, validation failed.")
      obj.height&.is_a?(Integer) != false || raise("Passed value for field obj.height is not the expected type, validation failed.")
      obj.resize&.is_a?(String) != false || raise("Passed value for field obj.resize is not the expected type, validation failed.")
      obj.quality&.is_a?(Integer) != false || raise("Passed value for field obj.quality is not the expected type, validation failed.")
    end
  end
end
