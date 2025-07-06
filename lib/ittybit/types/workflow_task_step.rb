# frozen_string_literal: true

require_relative "workflow_task_step_kind"
require "ostruct"
require "json"

module Ittybit
  class WorkflowTaskStep
    # @return [Ittybit::WorkflowTaskStepKind]
    attr_reader :kind
    # @return [String]
    attr_reader :ref
    # @return [String]
    attr_reader :format
    # @return [Float]
    attr_reader :start
    # @return [Float]
    attr_reader :end_
    # @return [Integer]
    attr_reader :width
    # @return [Integer]
    attr_reader :height
    # @return [String]
    attr_reader :fit
    # @return [String]
    attr_reader :background
    # @return [Integer]
    attr_reader :quality
    # @return [Array<Object>]
    attr_reader :next_
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param kind [Ittybit::WorkflowTaskStepKind]
    # @param ref [String]
    # @param format [String]
    # @param start [Float]
    # @param end_ [Float]
    # @param width [Integer]
    # @param height [Integer]
    # @param fit [String]
    # @param background [String]
    # @param quality [Integer]
    # @param next_ [Array<Object>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::WorkflowTaskStep]
    def initialize(kind:, ref: OMIT, format: OMIT, start: OMIT, end_: OMIT, width: OMIT, height: OMIT, fit: OMIT,
                   background: OMIT, quality: OMIT, next_: OMIT, additional_properties: nil)
      @kind = kind
      @ref = ref if ref != OMIT
      @format = format if format != OMIT
      @start = start if start != OMIT
      @end_ = end_ if end_ != OMIT
      @width = width if width != OMIT
      @height = height if height != OMIT
      @fit = fit if fit != OMIT
      @background = background if background != OMIT
      @quality = quality if quality != OMIT
      @next_ = next_ if next_ != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "kind": kind,
        "ref": ref,
        "format": format,
        "start": start,
        "end": end_,
        "width": width,
        "height": height,
        "fit": fit,
        "background": background,
        "quality": quality,
        "next": next_
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
      ref = parsed_json["ref"]
      format = parsed_json["format"]
      start = parsed_json["start"]
      end_ = parsed_json["end"]
      width = parsed_json["width"]
      height = parsed_json["height"]
      fit = parsed_json["fit"]
      background = parsed_json["background"]
      quality = parsed_json["quality"]
      next_ = parsed_json["next"]
      new(
        kind: kind,
        ref: ref,
        format: format,
        start: start,
        end_: end_,
        width: width,
        height: height,
        fit: fit,
        background: background,
        quality: quality,
        next_: next_,
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
      obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
      obj.format&.is_a?(String) != false || raise("Passed value for field obj.format is not the expected type, validation failed.")
      obj.start&.is_a?(Float) != false || raise("Passed value for field obj.start is not the expected type, validation failed.")
      obj.end_&.is_a?(Float) != false || raise("Passed value for field obj.end_ is not the expected type, validation failed.")
      obj.width&.is_a?(Integer) != false || raise("Passed value for field obj.width is not the expected type, validation failed.")
      obj.height&.is_a?(Integer) != false || raise("Passed value for field obj.height is not the expected type, validation failed.")
      obj.fit&.is_a?(String) != false || raise("Passed value for field obj.fit is not the expected type, validation failed.")
      obj.background&.is_a?(String) != false || raise("Passed value for field obj.background is not the expected type, validation failed.")
      obj.quality&.is_a?(Integer) != false || raise("Passed value for field obj.quality is not the expected type, validation failed.")
      obj.next_&.is_a?(Array) != false || raise("Passed value for field obj.next_ is not the expected type, validation failed.")
    end
  end
end
