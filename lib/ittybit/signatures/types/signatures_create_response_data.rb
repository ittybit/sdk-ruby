# frozen_string_literal: true

require "ostruct"
require "json"

module Ittybit
  class Signatures
    class SignaturesCreateResponseData
      # @return [String]
      attr_reader :domain
      # @return [String]
      attr_reader :filename
      # @return [String]
      attr_reader :folder
      # @return [Integer]
      attr_reader :expiry
      # @return [String]
      attr_reader :method
      # @return [String]
      attr_reader :signature
      # @return [String]
      attr_reader :url
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param domain [String]
      # @param filename [String]
      # @param folder [String]
      # @param expiry [Integer]
      # @param method [String]
      # @param signature [String]
      # @param url [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ittybit::Signatures::SignaturesCreateResponseData]
      def initialize(domain:, filename:, expiry:, method:, signature:, url:, folder: OMIT, additional_properties: nil)
        @domain = domain
        @filename = filename
        @folder = folder if folder != OMIT
        @expiry = expiry
        @method = method
        @signature = signature
        @url = url
        @additional_properties = additional_properties
        @_field_set = {
          "domain": domain,
          "filename": filename,
          "folder": folder,
          "expiry": expiry,
          "method": method,
          "signature": signature,
          "url": url
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of SignaturesCreateResponseData
      #
      # @param json_object [String]
      # @return [Ittybit::Signatures::SignaturesCreateResponseData]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        domain = parsed_json["domain"]
        filename = parsed_json["filename"]
        folder = parsed_json["folder"]
        expiry = parsed_json["expiry"]
        method = parsed_json["method"]
        signature = parsed_json["signature"]
        url = parsed_json["url"]
        new(
          domain: domain,
          filename: filename,
          folder: folder,
          expiry: expiry,
          method: method,
          signature: signature,
          url: url,
          additional_properties: struct
        )
      end

      # Serialize an instance of SignaturesCreateResponseData to a JSON object
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
        obj.domain.is_a?(String) != false || raise("Passed value for field obj.domain is not the expected type, validation failed.")
        obj.filename.is_a?(String) != false || raise("Passed value for field obj.filename is not the expected type, validation failed.")
        obj.folder&.is_a?(String) != false || raise("Passed value for field obj.folder is not the expected type, validation failed.")
        obj.expiry.is_a?(Integer) != false || raise("Passed value for field obj.expiry is not the expected type, validation failed.")
        obj.method.is_a?(String) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
        obj.signature.is_a?(String) != false || raise("Passed value for field obj.signature is not the expected type, validation failed.")
        obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      end
    end
  end
end
