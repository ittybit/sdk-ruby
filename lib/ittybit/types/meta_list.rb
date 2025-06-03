# frozen_string_literal: true

require "ostruct"
require "json"

module Ittybit
  class MetaList
    # @return [String] Request ID
    attr_reader :request_id
    # @return [String] Type of the primary data value in the response
    attr_reader :type
    # @return [Integer] Number of items per page.
    attr_reader :limit
    # @return [Integer] Total number of items matching the query.
    attr_reader :total
    # @return [Integer] Current page number.
    attr_reader :page
    # @return [Integer] Total number of pages.
    attr_reader :pages
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param request_id [String] Request ID
    # @param type [String] Type of the primary data value in the response
    # @param limit [Integer] Number of items per page.
    # @param total [Integer] Total number of items matching the query.
    # @param page [Integer] Current page number.
    # @param pages [Integer] Total number of pages.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Ittybit::MetaList]
    def initialize(request_id: OMIT, type: OMIT, limit: OMIT, total: OMIT, page: OMIT, pages: OMIT,
                   additional_properties: nil)
      @request_id = request_id if request_id != OMIT
      @type = type if type != OMIT
      @limit = limit if limit != OMIT
      @total = total if total != OMIT
      @page = page if page != OMIT
      @pages = pages if pages != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "request_id": request_id,
        "type": type,
        "limit": limit,
        "total": total,
        "page": page,
        "pages": pages
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of MetaList
    #
    # @param json_object [String]
    # @return [Ittybit::MetaList]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      request_id = parsed_json["request_id"]
      type = parsed_json["type"]
      limit = parsed_json["limit"]
      total = parsed_json["total"]
      page = parsed_json["page"]
      pages = parsed_json["pages"]
      new(
        request_id: request_id,
        type: type,
        limit: limit,
        total: total,
        page: page,
        pages: pages,
        additional_properties: struct
      )
    end

    # Serialize an instance of MetaList to a JSON object
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
      obj.request_id&.is_a?(String) != false || raise("Passed value for field obj.request_id is not the expected type, validation failed.")
      obj.type&.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.limit&.is_a?(Integer) != false || raise("Passed value for field obj.limit is not the expected type, validation failed.")
      obj.total&.is_a?(Integer) != false || raise("Passed value for field obj.total is not the expected type, validation failed.")
      obj.page&.is_a?(Integer) != false || raise("Passed value for field obj.page is not the expected type, validation failed.")
      obj.pages&.is_a?(Integer) != false || raise("Passed value for field obj.pages is not the expected type, validation failed.")
    end
  end
end
