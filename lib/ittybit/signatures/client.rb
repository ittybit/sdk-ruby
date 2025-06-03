# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/signatures_create_request_method"
require_relative "../types/signature_response"
require "async"

module Ittybit
  class SignaturesClient
    # @return [Ittybit::RequestClient]
    attr_reader :request_client

    # @param request_client [Ittybit::RequestClient]
    # @return [Ittybit::SignaturesClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Creates a cryptographically signed URL that provides temporary and restricted
    #  access to a file. The URL can expire after a specified time and be limited to
    #  specific HTTP methods.
    #
    # @param filename [String] The name of the file to generate a signature for. Special characters will be
    #  sanitised.
    # @param folder [String] Optional folder path where the file resides. Special characters will be
    #  sanitised.
    # @param expiry [Long] Optional expiry time for the signature in seconds since epoch. Defaults to 60
    #  minutes from now. Must be a positive integer and in the future.
    # @param method [Ittybit::Signatures::SignaturesCreateRequestMethod] Optional HTTP method allowed for the signed URL. Defaults to 'get'.
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::SignatureResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.signatures.create(
    #    filename: "video.mp4",
    #    folder: "private/user_123",
    #    expiry: 1735689600,
    #    method: GET
    #  )
    def create(filename:, folder: nil, expiry: nil, method: nil, request_options: nil)
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
          filename: filename,
          folder: folder,
          expiry: expiry,
          method: method
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/signatures"
      end
      Ittybit::SignatureResponse.from_json(json_object: response.body)
    end
  end

  class AsyncSignaturesClient
    # @return [Ittybit::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Ittybit::AsyncRequestClient]
    # @return [Ittybit::AsyncSignaturesClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Creates a cryptographically signed URL that provides temporary and restricted
    #  access to a file. The URL can expire after a specified time and be limited to
    #  specific HTTP methods.
    #
    # @param filename [String] The name of the file to generate a signature for. Special characters will be
    #  sanitised.
    # @param folder [String] Optional folder path where the file resides. Special characters will be
    #  sanitised.
    # @param expiry [Long] Optional expiry time for the signature in seconds since epoch. Defaults to 60
    #  minutes from now. Must be a positive integer and in the future.
    # @param method [Ittybit::Signatures::SignaturesCreateRequestMethod] Optional HTTP method allowed for the signed URL. Defaults to 'get'.
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::SignatureResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.signatures.create(
    #    filename: "video.mp4",
    #    folder: "private/user_123",
    #    expiry: 1735689600,
    #    method: GET
    #  )
    def create(filename:, folder: nil, expiry: nil, method: nil, request_options: nil)
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
            filename: filename,
            folder: folder,
            expiry: expiry,
            method: method
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/signatures"
        end
        Ittybit::SignatureResponse.from_json(json_object: response.body)
      end
    end
  end
end
