# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/media_list_response"
require_relative "../types/media_response"
require_relative "../types/confirmation_response"
require "async"

module Ittybit
  class MediaClient
    # @return [Ittybit::RequestClient]
    attr_reader :request_client

    # @param request_client [Ittybit::RequestClient]
    # @return [Ittybit::MediaClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieves a paginated list of all media for the current project
    #
    # @param page [Integer]
    # @param limit [Integer]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::MediaListResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.media.list
    def list(page: nil, limit: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers["ACCEPT_VERSION"] = request_options.version unless request_options&.version.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "page": page, "limit": limit }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/media"
      end
      Ittybit::MediaListResponse.from_json(json_object: response.body)
    end

    # Creates a new media item. See [Media Object](/docs/media) for more details.
    #
    # @param title [String]
    # @param alt [String]
    # @param metadata [Hash{String => Object}]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::MediaResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.media.create(
    #    title: "My Video Example",
    #    alt: "An example video used to demonstrate the ittybit API",
    #    metadata: { "customKey2": "a different custom value" }
    #  )
    def create(title: nil, alt: nil, metadata: nil, request_options: nil)
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
          title: title,
          alt: alt,
          metadata: metadata
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/media"
      end
      Ittybit::MediaResponse.from_json(json_object: response.body)
    end

    # Retrieves the media object for a media with the given ID.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::MediaResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.media.get(id: "med_abcdefgh1234")
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
        req.url "#{@request_client.get_url(request_options: request_options)}/media/#{id}"
      end
      Ittybit::MediaResponse.from_json(json_object: response.body)
    end

    # Permanently removes a media object from the system. This action cannot be
    #  undone.
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
    #  api.media.delete(id: "med_abcdefgh1234")
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
        req.url "#{@request_client.get_url(request_options: request_options)}/media/#{id}"
      end
      Ittybit::ConfirmationResponse.from_json(json_object: response.body)
    end

    # Updates a media object's `title`, `alt`, or `metadata`. Only the specified
    #  fields will be updated.
    #
    # @param id [String]
    # @param title [String]
    # @param alt [String]
    # @param metadata [Hash{String => Object}]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::MediaResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.media.update(
    #    id: "med_abcdefgh1234",
    #    title: "Updated Video Example",
    #    alt: "An updated example video used to demonstrate the ittybit API",
    #    metadata: { "customKey2": "a different custom value" }
    #  )
    def update(id:, title: nil, alt: nil, metadata: nil, request_options: nil)
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
          title: title,
          alt: alt,
          metadata: metadata
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/media/#{id}"
      end
      Ittybit::MediaResponse.from_json(json_object: response.body)
    end
  end

  class AsyncMediaClient
    # @return [Ittybit::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Ittybit::AsyncRequestClient]
    # @return [Ittybit::AsyncMediaClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieves a paginated list of all media for the current project
    #
    # @param page [Integer]
    # @param limit [Integer]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::MediaListResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.media.list
    def list(page: nil, limit: nil, request_options: nil)
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
          req.params = { **(request_options&.additional_query_parameters || {}), "page": page, "limit": limit }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/media"
        end
        Ittybit::MediaListResponse.from_json(json_object: response.body)
      end
    end

    # Creates a new media item. See [Media Object](/docs/media) for more details.
    #
    # @param title [String]
    # @param alt [String]
    # @param metadata [Hash{String => Object}]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::MediaResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.media.create(
    #    title: "My Video Example",
    #    alt: "An example video used to demonstrate the ittybit API",
    #    metadata: { "customKey2": "a different custom value" }
    #  )
    def create(title: nil, alt: nil, metadata: nil, request_options: nil)
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
            title: title,
            alt: alt,
            metadata: metadata
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/media"
        end
        Ittybit::MediaResponse.from_json(json_object: response.body)
      end
    end

    # Retrieves the media object for a media with the given ID.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::MediaResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.media.get(id: "med_abcdefgh1234")
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
          req.url "#{@request_client.get_url(request_options: request_options)}/media/#{id}"
        end
        Ittybit::MediaResponse.from_json(json_object: response.body)
      end
    end

    # Permanently removes a media object from the system. This action cannot be
    #  undone.
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
    #  api.media.delete(id: "med_abcdefgh1234")
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
          req.url "#{@request_client.get_url(request_options: request_options)}/media/#{id}"
        end
        Ittybit::ConfirmationResponse.from_json(json_object: response.body)
      end
    end

    # Updates a media object's `title`, `alt`, or `metadata`. Only the specified
    #  fields will be updated.
    #
    # @param id [String]
    # @param title [String]
    # @param alt [String]
    # @param metadata [Hash{String => Object}]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::MediaResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.media.update(
    #    id: "med_abcdefgh1234",
    #    title: "Updated Video Example",
    #    alt: "An updated example video used to demonstrate the ittybit API",
    #    metadata: { "customKey2": "a different custom value" }
    #  )
    def update(id:, title: nil, alt: nil, metadata: nil, request_options: nil)
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
            title: title,
            alt: alt,
            metadata: metadata
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/media/#{id}"
        end
        Ittybit::MediaResponse.from_json(json_object: response.body)
      end
    end
  end
end
