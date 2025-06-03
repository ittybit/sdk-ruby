# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/file_list_response"
require_relative "../types/file_response"
require_relative "types/files_delete_response"
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
    #  Files can be filtered using query parameters.
    #
    # @param limit [Integer] Items per page
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::FileListResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.list
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
        req.url "#{@request_client.get_url(request_options: request_options)}/files"
      end
      Ittybit::FileListResponse.from_json(json_object: response.body)
    end

    # Registers a file from a publicly accessible URL. The file will be ingested
    #  asynchronously.
    #
    # @param url [String] The publicly accessible URL of the file to ingest.
    # @param filename [String] Optional desired filename. If not provided, it may be derived from the URL.
    # @param folder [String] Folder path (optional)
    # @param media_id [String] Optional existing media ID to associate the file with.
    # @param label [String] Optional label for the file.
    # @param metadata [Hash{String => Object}] Optional user-defined key-value metadata.
    # @param async [Boolean] Whether to process the ingestion asynchronously.
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::FileResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.create(
    #    url: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    #    filename: "bunny.mp4",
    #    folder: "examples/cartoons",
    #    metadata: { "credit": "gtv-videos-bucket" }
    #  )
    def create(url:, filename: nil, folder: nil, media_id: nil, label: nil, metadata: nil, async: nil,
               request_options: nil)
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
          url: url,
          filename: filename,
          folder: folder,
          media_id: media_id,
          label: label,
          metadata: metadata,
          async: async
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/files"
      end
      Ittybit::FileResponse.from_json(json_object: response.body)
    end

    # Retrieves detailed information about a specific file identified by its unique
    #  ID, including its metadata, media associations, and technical properties.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::FileResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.get(id: "id")
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
        req.url "#{@request_client.get_url(request_options: request_options)}/files/#{id}"
      end
      Ittybit::FileResponse.from_json(json_object: response.body)
    end

    # Permanently removes a file from the system. This action cannot be undone.
    #  Associated media entries may still reference this file ID.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Files::FilesDeleteResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.delete(id: "id")
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
        req.url "#{@request_client.get_url(request_options: request_options)}/files/#{id}"
      end
      Ittybit::Files::FilesDeleteResponse.from_json(json_object: response.body)
    end

    # Updates metadata, filename, or folder properties of an existing file. Only the
    #  specified fields will be updated.
    #
    # @param id [String]
    # @param metadata [Hash{String => Object}] An object containing key-value pairs to set or update. Set a key to null to
    #  remove it.
    # @param filename [String] New filename for the file.
    # @param folder [String] New folder path for the file.
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::FileResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.update(
    #    id: "id",
    #    filename: "final_approved_video.mp4",
    #    folder: "archive/2024"
    #  )
    def update(id:, metadata: nil, filename: nil, folder: nil, request_options: nil)
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
          metadata: metadata,
          filename: filename,
          folder: folder
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/files/#{id}"
      end
      Ittybit::FileResponse.from_json(json_object: response.body)
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
    #  Files can be filtered using query parameters.
    #
    # @param limit [Integer] Items per page
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::FileListResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.list
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
          req.url "#{@request_client.get_url(request_options: request_options)}/files"
        end
        Ittybit::FileListResponse.from_json(json_object: response.body)
      end
    end

    # Registers a file from a publicly accessible URL. The file will be ingested
    #  asynchronously.
    #
    # @param url [String] The publicly accessible URL of the file to ingest.
    # @param filename [String] Optional desired filename. If not provided, it may be derived from the URL.
    # @param folder [String] Folder path (optional)
    # @param media_id [String] Optional existing media ID to associate the file with.
    # @param label [String] Optional label for the file.
    # @param metadata [Hash{String => Object}] Optional user-defined key-value metadata.
    # @param async [Boolean] Whether to process the ingestion asynchronously.
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::FileResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.create(
    #    url: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    #    filename: "bunny.mp4",
    #    folder: "examples/cartoons",
    #    metadata: { "credit": "gtv-videos-bucket" }
    #  )
    def create(url:, filename: nil, folder: nil, media_id: nil, label: nil, metadata: nil, async: nil,
               request_options: nil)
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
            url: url,
            filename: filename,
            folder: folder,
            media_id: media_id,
            label: label,
            metadata: metadata,
            async: async
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/files"
        end
        Ittybit::FileResponse.from_json(json_object: response.body)
      end
    end

    # Retrieves detailed information about a specific file identified by its unique
    #  ID, including its metadata, media associations, and technical properties.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::FileResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.get(id: "id")
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
          req.url "#{@request_client.get_url(request_options: request_options)}/files/#{id}"
        end
        Ittybit::FileResponse.from_json(json_object: response.body)
      end
    end

    # Permanently removes a file from the system. This action cannot be undone.
    #  Associated media entries may still reference this file ID.
    #
    # @param id [String]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::Files::FilesDeleteResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.delete(id: "id")
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
          req.url "#{@request_client.get_url(request_options: request_options)}/files/#{id}"
        end
        Ittybit::Files::FilesDeleteResponse.from_json(json_object: response.body)
      end
    end

    # Updates metadata, filename, or folder properties of an existing file. Only the
    #  specified fields will be updated.
    #
    # @param id [String]
    # @param metadata [Hash{String => Object}] An object containing key-value pairs to set or update. Set a key to null to
    #  remove it.
    # @param filename [String] New filename for the file.
    # @param folder [String] New folder path for the file.
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::FileResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.files.update(
    #    id: "id",
    #    filename: "final_approved_video.mp4",
    #    folder: "archive/2024"
    #  )
    def update(id:, metadata: nil, filename: nil, folder: nil, request_options: nil)
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
            metadata: metadata,
            filename: filename,
            folder: folder
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/files/#{id}"
        end
        Ittybit::FileResponse.from_json(json_object: response.body)
      end
    end
  end
end
