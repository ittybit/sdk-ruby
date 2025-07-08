# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/automation_list_response"
require_relative "../types/automation_response"
require_relative "../types/confirmation_response"
require_relative "types/update_automation_request_trigger"
require_relative "../types/workflow_task_step"
require_relative "types/update_automation_request_status"
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

    # Retrieves a paginated list of all automations for the current project
    #
    # @param limit [Integer]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::AutomationListResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.list
    def list(limit: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers["ACCEPT_VERSION"] = request_options.version unless request_options&.version.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/automations"
      end
      Ittybit::AutomationListResponse.from_json(json_object: response.body)
    end

    # Creates a new automation.
    #
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::AutomationResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.create
    def create(request_options: nil)
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
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/automations"
      end
      Ittybit::AutomationResponse.from_json(json_object: response.body)
    end

    # Retrieve the automation object for a automation with the given ID.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::AutomationResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.get(id: "id")
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
        req.url "#{@request_client.get_url(request_options: request_options)}/automations/#{id}"
      end
      Ittybit::AutomationResponse.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Void]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.update(id: "id")
    def update(id:, request_options: nil)
      @request_client.conn.put do |req|
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
        req.url "#{@request_client.get_url(request_options: request_options)}/automations/#{id}"
      end
    end

    # Permanently removes an automation from the system. This action cannot be undone.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::ConfirmationResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.delete(id: "id")
    def delete(id:, request_options: nil)
      response = @request_client.conn.delete do |req|
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
        req.url "#{@request_client.get_url(request_options: request_options)}/automations/#{id}"
      end
      Ittybit::ConfirmationResponse.from_json(json_object: response.body)
    end

    # Updates an automation's `name`, `description`, `trigger`, `workflow`, or
    #  `status`. Only the specified fields will be updated.
    #
    # @param id [String]
    # @param name [String]
    # @param description [String]
    # @param trigger [Hash] Request of type Ittybit::Automations::UpdateAutomationRequestTrigger, as a Hash
    #   * :kind (String)
    #   * :event (String)
    # @param workflow [Array<Hash>] Request of type Array<Ittybit::WorkflowTaskStep>, as a Hash
    #   * :kind (Ittybit::WorkflowTaskStepKind)
    #   * :ref (String)
    #   * :next_ (Array<Ittybit::WorkflowTaskStepNextItem>)
    # @param status [Ittybit::Automations::UpdateAutomationRequestStatus]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::AutomationResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.update_automation(
    #    id: "auto_abcdefgh1234",
    #    name: "My Updated Automation",
    #    workflow: [{ kind: NSFW }, { kind: DESCRIPTION }, { kind: IMAGE, ref: "big_thumbnail" }, { kind: CONDITIONS, next_: [{ kind: "subtitle", ref: "subtitle" }] }],
    #    status: ACTIVE
    #  )
    def update_automation(id:, name: nil, description: nil, trigger: nil, workflow: nil, status: nil,
                          request_options: nil)
      response = @request_client.conn.patch do |req|
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
          name: name,
          description: description,
          trigger: trigger,
          workflow: workflow,
          status: status
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/automations/#{id}"
      end
      Ittybit::AutomationResponse.from_json(json_object: response.body)
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

    # Retrieves a paginated list of all automations for the current project
    #
    # @param limit [Integer]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::AutomationListResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.list
    def list(limit: nil, request_options: nil)
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
          req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/automations"
        end
        Ittybit::AutomationListResponse.from_json(json_object: response.body)
      end
    end

    # Creates a new automation.
    #
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::AutomationResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.create
    def create(request_options: nil)
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
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/automations"
        end
        Ittybit::AutomationResponse.from_json(json_object: response.body)
      end
    end

    # Retrieve the automation object for a automation with the given ID.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::AutomationResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.get(id: "id")
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
          req.url "#{@request_client.get_url(request_options: request_options)}/automations/#{id}"
        end
        Ittybit::AutomationResponse.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Void]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.update(id: "id")
    def update(id:, request_options: nil)
      Async do
        @request_client.conn.put do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/automations/#{id}"
        end
      end
    end

    # Permanently removes an automation from the system. This action cannot be undone.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::ConfirmationResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.delete(id: "id")
    def delete(id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/automations/#{id}"
        end
        Ittybit::ConfirmationResponse.from_json(json_object: response.body)
      end
    end

    # Updates an automation's `name`, `description`, `trigger`, `workflow`, or
    #  `status`. Only the specified fields will be updated.
    #
    # @param id [String]
    # @param name [String]
    # @param description [String]
    # @param trigger [Hash] Request of type Ittybit::Automations::UpdateAutomationRequestTrigger, as a Hash
    #   * :kind (String)
    #   * :event (String)
    # @param workflow [Array<Hash>] Request of type Array<Ittybit::WorkflowTaskStep>, as a Hash
    #   * :kind (Ittybit::WorkflowTaskStepKind)
    #   * :ref (String)
    #   * :next_ (Array<Ittybit::WorkflowTaskStepNextItem>)
    # @param status [Ittybit::Automations::UpdateAutomationRequestStatus]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::AutomationResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.update_automation(
    #    id: "auto_abcdefgh1234",
    #    name: "My Updated Automation",
    #    workflow: [{ kind: NSFW }, { kind: DESCRIPTION }, { kind: IMAGE, ref: "big_thumbnail" }, { kind: CONDITIONS, next_: [{ kind: "subtitle", ref: "subtitle" }] }],
    #    status: ACTIVE
    #  )
    def update_automation(id:, name: nil, description: nil, trigger: nil, workflow: nil, status: nil,
                          request_options: nil)
      Async do
        response = @request_client.conn.patch do |req|
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
            name: name,
            description: description,
            trigger: trigger,
            workflow: workflow,
            status: status
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/automations/#{id}"
        end
        Ittybit::AutomationResponse.from_json(json_object: response.body)
      end
    end
  end
end
