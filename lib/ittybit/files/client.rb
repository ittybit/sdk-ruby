# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/files_list_response"
require_relative "types/files_create_response"
require_relative "types/files_get_response"
require_relative "types/files_delete_response"
require_relative "types/files_update_response"
require "async"

module Ittybit
  class FilesClient
    # @return [Ittybit::RequestClient]
    attr_reader :request_client

    # @param request_client [Ittybit::RequestClient]
    # @return [Ittybit::FilesClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieves a paginated list of all files associated with the current project.
    #
    # @param page [Integer]
    # @param limit [Integer]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Files::FilesListResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.list
    def list(page: nil, limit: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
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
        req.url "#{@request_client.get_url(request_options: request_options)}/files"
      end
      Ittybit::Files::FilesListResponse.from_json(json_object: response.body)
    end

    # Creates a new file from a publicly accessible or signed URL.
    #
    # @param url [String]
    # @param media_id [String]
    # @param folder [String]
    # @param filename [String]
    # @param ref [String]
    # @param metadata [Hash{String => Object}]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Files::FilesCreateResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.create(
    #    url: "https://ittyb.it/sample.mp4",
    #    folder: "ittybit/samples",
    #    filename: "video.mp4",
    #    metadata: { "customKey": "your custom value" }
    #  )
    def create(url:, media_id: nil, folder: nil, filename: nil, ref: nil, metadata: nil, request_options: nil)
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
          url: url,
          media_id: media_id,
          folder: folder,
          filename: filename,
          ref: ref,
          metadata: metadata
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/files"
      end
      Ittybit::Files::FilesCreateResponse.from_json(json_object: response.body)
    end

    # Retrieve the file object for a file with the given ID.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Files::FilesGetResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.get(id: "file_abcdefgh1234")
    def get(id:, request_options: nil)
      response = @request_client.conn.get do |req|
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
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/files/#{id}"
      end
      Ittybit::Files::FilesGetResponse.from_json(json_object: response.body)
    end

    # Permanently removes a file from the system. This action cannot be undone.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Files::FilesDeleteResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.delete(id: "file_abcdefgh1234")
    def delete(id:, request_options: nil)
      response = @request_client.conn.delete do |req|
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
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/files/#{id}"
      end
      Ittybit::Files::FilesDeleteResponse.from_json(json_object: response.body)
    end

    # Update a file's `filename`, `folder`, `ref`, or `metadata`. Only the specified
    #  fields will be updated.
    #
    # @param id [String]
    # @param folder [String]
    # @param filename [String]
    # @param ref [String]
    # @param metadata [Hash{String => Object}]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Files::FilesUpdateResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.update(
    #    id: "file_abcdefgh1234",
    #    folder: "updated/folder",
    #    filename: "new_filename.mp4",
    #    metadata: { "customKey2": "a different custom value" }
    #  )
    def update(id:, folder: nil, filename: nil, ref: nil, metadata: nil, request_options: nil)
      response = @request_client.conn.patch do |req|
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
          folder: folder,
          filename: filename,
          ref: ref,
          metadata: metadata
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/files/#{id}"
      end
      Ittybit::Files::FilesUpdateResponse.from_json(json_object: response.body)
    end
  end

  class AsyncFilesClient
    # @return [Ittybit::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Ittybit::AsyncRequestClient]
    # @return [Ittybit::AsyncFilesClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieves a paginated list of all files associated with the current project.
    #
    # @param page [Integer]
    # @param limit [Integer]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Files::FilesListResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.list
    def list(page: nil, limit: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
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
          req.url "#{@request_client.get_url(request_options: request_options)}/files"
        end
        Ittybit::Files::FilesListResponse.from_json(json_object: response.body)
      end
    end

    # Creates a new file from a publicly accessible or signed URL.
    #
    # @param url [String]
    # @param media_id [String]
    # @param folder [String]
    # @param filename [String]
    # @param ref [String]
    # @param metadata [Hash{String => Object}]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Files::FilesCreateResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.create(
    #    url: "https://ittyb.it/sample.mp4",
    #    folder: "ittybit/samples",
    #    filename: "video.mp4",
    #    metadata: { "customKey": "your custom value" }
    #  )
    def create(url:, media_id: nil, folder: nil, filename: nil, ref: nil, metadata: nil, request_options: nil)
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
            url: url,
            media_id: media_id,
            folder: folder,
            filename: filename,
            ref: ref,
            metadata: metadata
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/files"
        end
        Ittybit::Files::FilesCreateResponse.from_json(json_object: response.body)
      end
    end

    # Retrieve the file object for a file with the given ID.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Files::FilesGetResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.get(id: "file_abcdefgh1234")
    def get(id:, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
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
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/files/#{id}"
        end
        Ittybit::Files::FilesGetResponse.from_json(json_object: response.body)
      end
    end

    # Permanently removes a file from the system. This action cannot be undone.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Files::FilesDeleteResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.delete(id: "file_abcdefgh1234")
    def delete(id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do |req|
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
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/files/#{id}"
        end
        Ittybit::Files::FilesDeleteResponse.from_json(json_object: response.body)
      end
    end

    # Update a file's `filename`, `folder`, `ref`, or `metadata`. Only the specified
    #  fields will be updated.
    #
    # @param id [String]
    # @param folder [String]
    # @param filename [String]
    # @param ref [String]
    # @param metadata [Hash{String => Object}]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Files::FilesUpdateResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.update(
    #    id: "file_abcdefgh1234",
    #    folder: "updated/folder",
    #    filename: "new_filename.mp4",
    #    metadata: { "customKey2": "a different custom value" }
    #  )
    def update(id:, folder: nil, filename: nil, ref: nil, metadata: nil, request_options: nil)
      Async do
        response = @request_client.conn.patch do |req|
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
            folder: folder,
            filename: filename,
            ref: ref,
            metadata: metadata
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/files/#{id}"
        end
        Ittybit::Files::FilesUpdateResponse.from_json(json_object: response.body)
      end
    end
  end
end
