# frozen_string_literal: true

module Ittybit
  class TaskListResponseItemStatus
    PENDING = "pending"
    WAITING = "waiting"
    PROCESSING = "processing"
    READY = "ready"
    COMPLETED = "completed"
    FAILED = "failed"
    ERROR = "error"
    CANCELLED = "cancelled"
  end
end
