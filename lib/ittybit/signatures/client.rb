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

    # You can use signatures to create signed URLs which grant access to your
    #  project's resources, without revealing your project's API key. URLs can expire
    #  after a specified time and be limited to HTTP `GET` method for read-only access,
    #  or HTTP `PUT` method for client-side uploads.
    #
    # @param filename [String]
    # @param folder [String]
    # @param expiry [Integer]
    # @param method [Ittybit::Signatures::SignaturesCreateRequestMethod]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::SignatureResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.signatures.create(
    #    filename: "video.mp4",
    #    folder: "example",
    #    expiry: 1735689600,
    #    method: PUT
    #  )
    def create(filename:, folder: nil, expiry: nil, method: nil, request_options: nil)
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

    # You can use signatures to create signed URLs which grant access to your
    #  project's resources, without revealing your project's API key. URLs can expire
    #  after a specified time and be limited to HTTP `GET` method for read-only access,
    #  or HTTP `PUT` method for client-side uploads.
    #
    # @param filename [String]
    # @param folder [String]
    # @param expiry [Integer]
    # @param method [Ittybit::Signatures::SignaturesCreateRequestMethod]
    # @param request_options [Ittybit::RequestOptions]
    # @return [Ittybit::SignatureResponse]
    # @example
    #  api = Ittybit::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Ittybit::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.signatures.create(
    #    filename: "video.mp4",
    #    folder: "example",
    #    expiry: 1735689600,
    #    method: PUT
    #  )
    def create(filename:, folder: nil, expiry: nil, method: nil, request_options: nil)
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
