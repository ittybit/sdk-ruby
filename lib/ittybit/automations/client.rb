# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/automation_list_response"
require_relative "../types/automation_response"
require_relative "types/automations_update_request_trigger"
require_relative "../types/workflow_task_step"
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

    # Retrieves a list of all automations for the current project
    #
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::AutomationListResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.list
    def list(request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/automations"
      end
      Ittybit::AutomationListResponse.from_json(json_object: response.body)
    end

    # Creates a new automation for the current project
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

    # Retrieves a specific automation by its ID
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

    # Updates an existing automation by its ID
    #
    # @param id [String]
    # @param name [String]
    # @param description [String]
    # @param trigger [Hash] Defines the trigger event and conditions. To clear/remove a trigger, provide
    #  null. To update, provide the new trigger object.Request of type Ittybit::Automations::AutomationsUpdateRequestTrigger, as a Hash
    #   * :event (String)
    #   * :conditions (Array<Ittybit::Automations::AutomationsUpdateRequestTriggerConditionsItem>)
    # @param workflow [Array<Hash>] The updated sequence of tasks for the automation.Request of type Array<Ittybit::WorkflowTaskStep>, as a Hash
    #   * :kind (Ittybit::WorkflowTaskStepKind)
    #   * :ref (String)
    #   * :format (String)
    #   * :start (Float)
    #   * :end_ (Float)
    #   * :width (Integer)
    #   * :height (Integer)
    #   * :fit (String)
    #   * :background (String)
    #   * :quality (Integer)
    #   * :next_ (Array<Object>)
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::AutomationResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.update(
    #    id: "id",
    #    name: "Updated Transcoder Example",
    #    trigger: { event: "upload.completed", conditions: [{ prop: "file.type", value: "image/*" }] },
    #    workflow: [{ kind: IMAGE, format: "webp" }]
    #  )
    def update(id:, name:, description: nil, trigger: nil, workflow: nil, request_options: nil)
      response = @request_client.conn.put do |req|
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
          workflow: workflow
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/automations/#{id}"
      end
      Ittybit::AutomationResponse.from_json(json_object: response.body)
    end

    # Deletes an automation by its ID
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Void]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.delete(id: "id")
    def delete(id:, request_options: nil)
      @request_client.conn.delete do |req|
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

  class AsyncAutomationsClient
    # @return [Ittybit::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Ittybit::AsyncRequestClient]
    # @return [Ittybit::AsyncAutomationsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieves a list of all automations for the current project
    #
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::AutomationListResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.list
    def list(request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/automations"
        end
        Ittybit::AutomationListResponse.from_json(json_object: response.body)
      end
    end

    # Creates a new automation for the current project
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

    # Retrieves a specific automation by its ID
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

    # Updates an existing automation by its ID
    #
    # @param id [String]
    # @param name [String]
    # @param description [String]
    # @param trigger [Hash] Defines the trigger event and conditions. To clear/remove a trigger, provide
    #  null. To update, provide the new trigger object.Request of type Ittybit::Automations::AutomationsUpdateRequestTrigger, as a Hash
    #   * :event (String)
    #   * :conditions (Array<Ittybit::Automations::AutomationsUpdateRequestTriggerConditionsItem>)
    # @param workflow [Array<Hash>] The updated sequence of tasks for the automation.Request of type Array<Ittybit::WorkflowTaskStep>, as a Hash
    #   * :kind (Ittybit::WorkflowTaskStepKind)
    #   * :ref (String)
    #   * :format (String)
    #   * :start (Float)
    #   * :end_ (Float)
    #   * :width (Integer)
    #   * :height (Integer)
    #   * :fit (String)
    #   * :background (String)
    #   * :quality (Integer)
    #   * :next_ (Array<Object>)
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::AutomationResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.update(
    #    id: "id",
    #    name: "Updated Transcoder Example",
    #    trigger: { event: "upload.completed", conditions: [{ prop: "file.type", value: "image/*" }] },
    #    workflow: [{ kind: IMAGE, format: "webp" }]
    #  )
    def update(id:, name:, description: nil, trigger: nil, workflow: nil, request_options: nil)
      Async do
        response = @request_client.conn.put do |req|
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
            workflow: workflow
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/automations/#{id}"
        end
        Ittybit::AutomationResponse.from_json(json_object: response.body)
      end
    end

    # Deletes an automation by its ID
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Void]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.automations.delete(id: "id")
    def delete(id:, request_options: nil)
      Async do
        @request_client.conn.delete do |req|
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
  end
end
