# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/tasks_list_request_status"
require_relative "types/tasks_list_request_kind"
require_relative "../types/task_list_response"
require_relative "types/tasks_create_request_kind"
require_relative "../types/task_response"
require "json"
require "async"

module Ittybit
  class TasksClient
    # @return [Ittybit::RequestClient]
    attr_reader :request_client

    # @param request_client [Ittybit::RequestClient]
    # @return [Ittybit::TasksClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieves a list of tasks for the project, optionally filtered by status or
    #  kind.
    #
    # @param limit [Integer] Items per page.
    # @param status [Ittybit::Tasks::TasksListRequestStatus] Filter by task status.
    # @param kind [Ittybit::Tasks::TasksListRequestKind] Filter by task kind.
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::TaskListResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.tasks.list
    def list(limit: nil, status: nil, kind: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers["ACCEPT_VERSION"] = request_options.version unless request_options&.version.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "limit": limit,
          "status": status,
          "kind": kind
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/tasks"
      end
      Ittybit::TaskListResponse.from_json(json_object: response.body)
    end

    # Creates a new processing task (e.g., ingest, video transcode, speech analysis)
    #  or a workflow task.
    #
    # @param kind [Ittybit::Tasks::TasksCreateRequestKind] The type of task to create.
    # @param url [String] URL of the source file (required for 'ingest' kind unless file_id is used, can
    #  be used for others).
    # @param input [Hash{String => Object}] Task-specific input parameters depending on the kind of task.
    # @param file_id [String] ID of an existing file to use as input (alternative to url).
    # @param workflow [Array<Hash{String => Object}>] An array of task definition objects for a workflow.
    # @param webhook_url [String] An optional HTTPS URL to send a webhook notification to upon task completion or
    #  failure.
    # @param filename [String] Desired filename for the output (if applicable).
    # @param folder [String] Desired output folder (if applicable).
    # @param format [String] Output format (e.g., for video/image tasks).
    # @param width [Integer] Output width (for video/image tasks).
    # @param height [Integer] Output height (for video/image tasks).
    # @param quality [Integer] Output quality setting (e.g., for video/image tasks, 0-100).
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::TaskResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.tasks.create(
    #    kind: INGEST,
    #    url: "https://example.com/some_video.mov",
    #    input: { "options": {"filename":"custom_name.mov"} }
    #  )
    def create(kind:, url: nil, input: nil, file_id: nil, workflow: nil, webhook_url: nil, filename: nil, folder: nil,
               format: nil, width: nil, height: nil, quality: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers["ACCEPT_VERSION"] = request_options.version unless request_options&.version.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          kind: kind,
          url: url,
          input: input,
          file_id: file_id,
          workflow: workflow,
          webhook_url: webhook_url,
          filename: filename,
          folder: folder,
          format: format,
          width: width,
          height: height,
          quality: quality
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/tasks"
      end
      Ittybit::TaskResponse.from_json(json_object: response.body)
    end

    # Retrieves available task kinds and their configuration options.
    #
    # @param request_options [Ittybit::RequestOptions]
    # @return [Hash{String => Object}]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.tasks.get_task_config
    def get_task_config(request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers["ACCEPT_VERSION"] = request_options.version unless request_options&.version.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/tasks-config"
      end
      JSON.parse(response.body)
    end

    # Retrieves the details of a specific task by its ID.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::TaskResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.tasks.get(id: "id")
    def get(id:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers["ACCEPT_VERSION"] = request_options.version unless request_options&.version.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/tasks/#{id}"
      end
      Ittybit::TaskResponse.from_json(json_object: response.body)
    end
  end

  class AsyncTasksClient
    # @return [Ittybit::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Ittybit::AsyncRequestClient]
    # @return [Ittybit::AsyncTasksClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieves a list of tasks for the project, optionally filtered by status or
    #  kind.
    #
    # @param limit [Integer] Items per page.
    # @param status [Ittybit::Tasks::TasksListRequestStatus] Filter by task status.
    # @param kind [Ittybit::Tasks::TasksListRequestKind] Filter by task kind.
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::TaskListResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.tasks.list
    def list(limit: nil, status: nil, kind: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
          req.headers["ACCEPT_VERSION"] = request_options.version unless request_options&.version.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "limit": limit,
            "status": status,
            "kind": kind
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/tasks"
        end
        Ittybit::TaskListResponse.from_json(json_object: response.body)
      end
    end

    # Creates a new processing task (e.g., ingest, video transcode, speech analysis)
    #  or a workflow task.
    #
    # @param kind [Ittybit::Tasks::TasksCreateRequestKind] The type of task to create.
    # @param url [String] URL of the source file (required for 'ingest' kind unless file_id is used, can
    #  be used for others).
    # @param input [Hash{String => Object}] Task-specific input parameters depending on the kind of task.
    # @param file_id [String] ID of an existing file to use as input (alternative to url).
    # @param workflow [Array<Hash{String => Object}>] An array of task definition objects for a workflow.
    # @param webhook_url [String] An optional HTTPS URL to send a webhook notification to upon task completion or
    #  failure.
    # @param filename [String] Desired filename for the output (if applicable).
    # @param folder [String] Desired output folder (if applicable).
    # @param format [String] Output format (e.g., for video/image tasks).
    # @param width [Integer] Output width (for video/image tasks).
    # @param height [Integer] Output height (for video/image tasks).
    # @param quality [Integer] Output quality setting (e.g., for video/image tasks, 0-100).
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::TaskResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.tasks.create(
    #    kind: INGEST,
    #    url: "https://example.com/some_video.mov",
    #    input: { "options": {"filename":"custom_name.mov"} }
    #  )
    def create(kind:, url: nil, input: nil, file_id: nil, workflow: nil, webhook_url: nil, filename: nil, folder: nil,
               format: nil, width: nil, height: nil, quality: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
          req.headers["ACCEPT_VERSION"] = request_options.version unless request_options&.version.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            kind: kind,
            url: url,
            input: input,
            file_id: file_id,
            workflow: workflow,
            webhook_url: webhook_url,
            filename: filename,
            folder: folder,
            format: format,
            width: width,
            height: height,
            quality: quality
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/tasks"
        end
        Ittybit::TaskResponse.from_json(json_object: response.body)
      end
    end

    # Retrieves available task kinds and their configuration options.
    #
    # @param request_options [Ittybit::RequestOptions]
    # @return [Hash{String => Object}]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.tasks.get_task_config
    def get_task_config(request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
          req.headers["ACCEPT_VERSION"] = request_options.version unless request_options&.version.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/tasks-config"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json
      end
    end

    # Retrieves the details of a specific task by its ID.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::TaskResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.tasks.get(id: "id")
    def get(id:, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
          req.headers["ACCEPT_VERSION"] = request_options.version unless request_options&.version.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/tasks/#{id}"
        end
        Ittybit::TaskResponse.from_json(json_object: response.body)
      end
    end
  end
end
