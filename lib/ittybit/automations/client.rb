# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/automations_list_response_item"
require "json"
require_relative "types/automations_create_request_trigger"
require_relative "types/automations_create_request_workflow_item"
require_relative "types/automations_create_request_status"
require_relative "types/automations_create_response"
require_relative "types/automations_get_response"
require_relative "types/automations_delete_response"
require_relative "types/automations_update_request_trigger"
require_relative "types/automations_update_request_workflow_item"
require_relative "types/automations_update_request_status"
require_relative "types/automations_update_response"
require "async"

module Ittybit
  class AutomationsClient
    # @return [Ittybit::RequestClient]
    attr_reader :request_client

    # @param request_client [Ittybit::RequestClient]
    # @return [Ittybit::AutomationsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieves a paginated list of all automations for the current project.
    #
    # @param page [Integer]
    # @param limit [Integer]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Array<Ittybit::Automations::AutomationsListResponseItem>]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.list
    def list(page: nil, limit: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers["ACCEPT_VERSION"] = request_options.version unless request_options&.version.nil?
        req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {}),
          "Accept-Version": "2025-08-20"
        }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "page": page, "limit": limit }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/automations"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        Ittybit::Automations::AutomationsListResponseItem.from_json(json_object: item)
      end
    end

    # Creates a new automation.
    #
    # @param name [String]
    # @param description [String]
    # @param trigger [Hash] Request of type Ittybit::Automations::AutomationsCreateRequestTrigger, as a Hash
    #   * :kind (String)
    #   * :event (String)
    # @param workflow [Array<Hash>] Request of type Array<Ittybit::Automations::AutomationsCreateRequestWorkflowItem>, as a Hash
    #   * :kind (Ittybit::Automations::AutomationsCreateRequestWorkflowItemKind)
    #   * :ref (String)
    #   * :next_ (Array<Ittybit::Automations::AutomationsCreateRequestWorkflowItemNextItem>)
    # @param status [Ittybit::Automations::AutomationsCreateRequestStatus]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Automations::AutomationsCreateResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.create(
    #    name: "My Example Automation",
    #    description: "This workflow will run whenever new media is created.",
    #    trigger: { kind: "event", event: "media.created" },
    #    workflow: [{ kind: DESCRIPTION }, { kind: IMAGE, ref: "thumbnail" }, { kind: VIDEO, next_: [{ kind: "subtitles", ref: "subtitles" }] }],
    #    status: ACTIVE
    #  )
    def create(trigger:, workflow:, name: nil, description: nil, status: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
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
          name: name,
          description: description,
          trigger: trigger,
          workflow: workflow,
          status: status
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/automations"
      end
      Ittybit::Automations::AutomationsCreateResponse.from_json(json_object: response.body)
    end

    # Retrieve the automation object for a automation with the given ID.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Automations::AutomationsGetResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.get(id: "auto_abcdefgh1234")
    def get(id:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers["ACCEPT_VERSION"] = request_options.version unless request_options&.version.nil?
        req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {}),
          "Accept-Version": "2025-08-20"
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/automations/#{id}"
      end
      Ittybit::Automations::AutomationsGetResponse.from_json(json_object: response.body)
    end

    # Permanently removes an automation from the system. This action cannot be undone.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Automations::AutomationsDeleteResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.delete(id: "auto_abcdefgh1234")
    def delete(id:, request_options: nil)
      response = @request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers["ACCEPT_VERSION"] = request_options.version unless request_options&.version.nil?
        req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {}),
          "Accept-Version": "2025-08-20"
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/automations/#{id}"
      end
      Ittybit::Automations::AutomationsDeleteResponse.from_json(json_object: response.body)
    end

    # Updates an automation's `name`, `description`, `trigger`, `workflow`, or
    #  `status`. Only the specified fields will be updated.
    #
    # @param id [String]
    # @param name [String]
    # @param description [String]
    # @param trigger [Hash] Request of type Ittybit::Automations::AutomationsUpdateRequestTrigger, as a Hash
    #   * :kind (String)
    #   * :event (String)
    # @param workflow [Array<Hash>] Request of type Array<Ittybit::Automations::AutomationsUpdateRequestWorkflowItem>, as a Hash
    #   * :kind (Ittybit::Automations::AutomationsUpdateRequestWorkflowItemKind)
    #   * :ref (String)
    #   * :next_ (Array<Ittybit::Automations::AutomationsUpdateRequestWorkflowItemNextItem>)
    # @param status [Ittybit::Automations::AutomationsUpdateRequestStatus]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Automations::AutomationsUpdateResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.update(
    #    id: "auto_abcdefgh1234",
    #    name: "My Updated Automation",
    #    workflow: [{ kind: NSFW }, { kind: DESCRIPTION }, { kind: IMAGE, ref: "big_thumbnail" }, { kind: VIDEO, next_: [{ kind: "subtitle", ref: "subtitle" }] }],
    #    status: ACTIVE
    #  )
    def update(id:, name: nil, description: nil, trigger: nil, workflow: nil, status: nil, request_options: nil)
      response = @request_client.conn.patch do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers["ACCEPT_VERSION"] = request_options.version unless request_options&.version.nil?
        req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {}),
          "Accept-Version": "2025-08-20"
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          name: name,
          description: description,
          trigger: trigger,
          workflow: workflow,
          status: status
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/automations/#{id}"
      end
      Ittybit::Automations::AutomationsUpdateResponse.from_json(json_object: response.body)
    end
  end

  class AsyncAutomationsClient
    # @return [Ittybit::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Ittybit::AsyncRequestClient]
    # @return [Ittybit::AsyncAutomationsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieves a paginated list of all automations for the current project.
    #
    # @param page [Integer]
    # @param limit [Integer]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Array<Ittybit::Automations::AutomationsListResponseItem>]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.list
    def list(page: nil, limit: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["ACCEPT_VERSION"] = request_options.version unless request_options&.version.nil?
          req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {}),
            "Accept-Version": "2025-08-20"
          }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "page": page, "limit": limit }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/automations"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          Ittybit::Automations::AutomationsListResponseItem.from_json(json_object: item)
        end
      end
    end

    # Creates a new automation.
    #
    # @param name [String]
    # @param description [String]
    # @param trigger [Hash] Request of type Ittybit::Automations::AutomationsCreateRequestTrigger, as a Hash
    #   * :kind (String)
    #   * :event (String)
    # @param workflow [Array<Hash>] Request of type Array<Ittybit::Automations::AutomationsCreateRequestWorkflowItem>, as a Hash
    #   * :kind (Ittybit::Automations::AutomationsCreateRequestWorkflowItemKind)
    #   * :ref (String)
    #   * :next_ (Array<Ittybit::Automations::AutomationsCreateRequestWorkflowItemNextItem>)
    # @param status [Ittybit::Automations::AutomationsCreateRequestStatus]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Automations::AutomationsCreateResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.create(
    #    name: "My Example Automation",
    #    description: "This workflow will run whenever new media is created.",
    #    trigger: { kind: "event", event: "media.created" },
    #    workflow: [{ kind: DESCRIPTION }, { kind: IMAGE, ref: "thumbnail" }, { kind: VIDEO, next_: [{ kind: "subtitles", ref: "subtitles" }] }],
    #    status: ACTIVE
    #  )
    def create(trigger:, workflow:, name: nil, description: nil, status: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
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
            name: name,
            description: description,
            trigger: trigger,
            workflow: workflow,
            status: status
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/automations"
        end
        Ittybit::Automations::AutomationsCreateResponse.from_json(json_object: response.body)
      end
    end

    # Retrieve the automation object for a automation with the given ID.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Automations::AutomationsGetResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.get(id: "auto_abcdefgh1234")
    def get(id:, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["ACCEPT_VERSION"] = request_options.version unless request_options&.version.nil?
          req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {}),
            "Accept-Version": "2025-08-20"
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/automations/#{id}"
        end
        Ittybit::Automations::AutomationsGetResponse.from_json(json_object: response.body)
      end
    end

    # Permanently removes an automation from the system. This action cannot be undone.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Automations::AutomationsDeleteResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.delete(id: "auto_abcdefgh1234")
    def delete(id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["ACCEPT_VERSION"] = request_options.version unless request_options&.version.nil?
          req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {}),
            "Accept-Version": "2025-08-20"
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/automations/#{id}"
        end
        Ittybit::Automations::AutomationsDeleteResponse.from_json(json_object: response.body)
      end
    end

    # Updates an automation's `name`, `description`, `trigger`, `workflow`, or
    #  `status`. Only the specified fields will be updated.
    #
    # @param id [String]
    # @param name [String]
    # @param description [String]
    # @param trigger [Hash] Request of type Ittybit::Automations::AutomationsUpdateRequestTrigger, as a Hash
    #   * :kind (String)
    #   * :event (String)
    # @param workflow [Array<Hash>] Request of type Array<Ittybit::Automations::AutomationsUpdateRequestWorkflowItem>, as a Hash
    #   * :kind (Ittybit::Automations::AutomationsUpdateRequestWorkflowItemKind)
    #   * :ref (String)
    #   * :next_ (Array<Ittybit::Automations::AutomationsUpdateRequestWorkflowItemNextItem>)
    # @param status [Ittybit::Automations::AutomationsUpdateRequestStatus]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Automations::AutomationsUpdateResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.update(
    #    id: "auto_abcdefgh1234",
    #    name: "My Updated Automation",
    #    workflow: [{ kind: NSFW }, { kind: DESCRIPTION }, { kind: IMAGE, ref: "big_thumbnail" }, { kind: VIDEO, next_: [{ kind: "subtitle", ref: "subtitle" }] }],
    #    status: ACTIVE
    #  )
    def update(id:, name: nil, description: nil, trigger: nil, workflow: nil, status: nil, request_options: nil)
      Async do
        response = @request_client.conn.patch do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["ACCEPT_VERSION"] = request_options.version unless request_options&.version.nil?
          req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {}),
            "Accept-Version": "2025-08-20"
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            name: name,
            description: description,
            trigger: trigger,
            workflow: workflow,
            status: status
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/automations/#{id}"
        end
        Ittybit::Automations::AutomationsUpdateResponse.from_json(json_object: response.body)
      end
    end
  end
end
