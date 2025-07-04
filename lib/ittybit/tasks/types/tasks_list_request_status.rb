# frozen_string_literal: true

module Ittybit
  class Tasks
    class TasksListRequestStatus
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
end
