# frozen_string_literal: true

module Ittybit
  # Processing status of the file.
  class MediaSourceStatus
    WAITING = "waiting"
    PROCESSING = "processing"
    READY = "ready"
    FAILED = "failed"
  end
end
