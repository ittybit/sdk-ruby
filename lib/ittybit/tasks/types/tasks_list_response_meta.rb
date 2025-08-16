# frozen_string_literal: true

require_relative "tasks_list_response_meta_type"
require "ostruct"
require "json"

module Ittybit
  class Tasks
    class TasksListResponseMeta
      # @return [String]
      attr_reader :request_id
      # @return [String]
      attr_reader :org_id
      # @return [String]
      attr_reader :project_id
      # @return [String]
      attr_reader :version
      # @return [Ittybit::Tasks::TasksListResponseMetaType]
      attr_reader :type
      # @return [Integer]
      attr_reader :limit
      # @return [Integer]
      attr_reader :total
      # @return [Integer]
      attr_reader :page
      # @return [Integer]
      attr_reader :pages
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param request_id [String]
      # @param org_id [String]
      # @param project_id [String]
      # @param version [String]
      # @param type [Ittybit::Tasks::TasksListResponseMetaType]
      # @param limit [Integer]
      # @param total [Integer]
      # @param page [Integer]
      # @param pages [Integer]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ittybit::Tasks::TasksListResponseMeta]
      def initialize(request_id: OMIT, org_id: OMIT, project_id: OMIT, version: OMIT, type: OMIT, limit: OMIT,
                     total: OMIT, page: OMIT, pages: OMIT, additional_properties: nil)
        @request_id = request_id if request_id != OMIT
        @org_id = org_id if org_id != OMIT
        @project_id = project_id if project_id != OMIT
        @version = version if version != OMIT
        @type = type if type != OMIT
        @limit = limit if limit != OMIT
        @total = total if total != OMIT
        @page = page if page != OMIT
        @pages = pages if pages != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "request_id": request_id,
          "org_id": org_id,
          "project_id": project_id,
          "version": version,
          "type": type,
          "limit": limit,
          "total": total,
          "page": page,
          "pages": pages
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of TasksListResponseMeta
      #
      # @param json_object [String]
      # @return [Ittybit::Tasks::TasksListResponseMeta]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        request_id = parsed_json["request_id"]
        org_id = parsed_json["org_id"]
        project_id = parsed_json["project_id"]
        version = parsed_json["version"]
        type = parsed_json["type"]
        limit = parsed_json["limit"]
        total = parsed_json["total"]
        page = parsed_json["page"]
        pages = parsed_json["pages"]
        new(
          request_id: request_id,
          org_id: org_id,
          project_id: project_id,
          version: version,
          type: type,
          limit: limit,
          total: total,
          page: page,
          pages: pages,
          additional_properties: struct
        )
      end

      # Serialize an instance of TasksListResponseMeta to a JSON object
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
        obj.org_id&.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
        obj.project_id&.is_a?(String) != false || raise("Passed value for field obj.project_id is not the expected type, validation failed.")
        obj.version&.is_a?(String) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
        obj.type&.is_a?(Ittybit::Tasks::TasksListResponseMetaType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.limit&.is_a?(Integer) != false || raise("Passed value for field obj.limit is not the expected type, validation failed.")
        obj.total&.is_a?(Integer) != false || raise("Passed value for field obj.total is not the expected type, validation failed.")
        obj.page&.is_a?(Integer) != false || raise("Passed value for field obj.page is not the expected type, validation failed.")
        obj.pages&.is_a?(Integer) != false || raise("Passed value for field obj.pages is not the expected type, validation failed.")
      end
    end
  end
end
