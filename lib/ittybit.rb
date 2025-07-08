# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "ittybit/automations/client"
require_relative "ittybit/files/client"
require_relative "ittybit/media/client"
require_relative "ittybit/tasks/client"
require_relative "ittybit/signatures/client"

module Ittybit
  class Client
    # @return [Ittybit::AutomationsClient]
    attr_reader :automations
    # @return [Ittybit::FilesClient]
    attr_reader :files
    # @return [Ittybit::MediaClient]
    attr_reader :media
    # @return [Ittybit::TasksClient]
    attr_reader :tasks
    # @return [Ittybit::SignaturesClient]
    attr_reader :signatures

    # @param base_url [String]
    # @param environment [Ittybit::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param token [String]
    # @param version [Integer]
    # @return [Ittybit::Client]
    def initialize(token:, base_url: nil, environment: Ittybit::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil, version: nil)
      @request_client = Ittybit::RequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        token: token,
        version: version
      )
      @automations = Ittybit::AutomationsClient.new(request_client: @request_client)
      @files = Ittybit::FilesClient.new(request_client: @request_client)
      @media = Ittybit::MediaClient.new(request_client: @request_client)
      @tasks = Ittybit::TasksClient.new(request_client: @request_client)
      @signatures = Ittybit::SignaturesClient.new(request_client: @request_client)
    end
  end

  class AsyncClient
    # @return [Ittybit::AsyncAutomationsClient]
    attr_reader :automations
    # @return [Ittybit::AsyncFilesClient]
    attr_reader :files
    # @return [Ittybit::AsyncMediaClient]
    attr_reader :media
    # @return [Ittybit::AsyncTasksClient]
    attr_reader :tasks
    # @return [Ittybit::AsyncSignaturesClient]
    attr_reader :signatures

    # @param base_url [String]
    # @param environment [Ittybit::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param token [String]
    # @param version [Integer]
    # @return [Ittybit::AsyncClient]
    def initialize(token:, base_url: nil, environment: Ittybit::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil, version: nil)
      @async_request_client = Ittybit::AsyncRequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        token: token,
        version: version
      )
      @automations = Ittybit::AsyncAutomationsClient.new(request_client: @async_request_client)
      @files = Ittybit::AsyncFilesClient.new(request_client: @async_request_client)
      @media = Ittybit::AsyncMediaClient.new(request_client: @async_request_client)
      @tasks = Ittybit::AsyncTasksClient.new(request_client: @async_request_client)
      @signatures = Ittybit::AsyncSignaturesClient.new(request_client: @async_request_client)
    end
  end
end
