# frozen_string_literal: true

module Ittybit
  # The type of operation the task performs.
  class WorkflowTaskStepKind
    INGEST = "ingest"
    WORKFLOW = "workflow"
    SPEECH = "speech"
    OUTLINE = "outline"
    CHAPTERS = "chapters"
    SUBTITLES = "subtitles"
    THUMBNAILS = "thumbnails"
    NSFW = "nsfw"
    SUMMARY = "summary"
    DESCRIBE = "describe"
    VIDEO = "video"
    IMAGE = "image"
    AUDIO = "audio"
    HTTP = "http"
    CONDITIONS = "conditions"
    STORE = "store"
    PROMPT = "prompt"
    TAGS = "tags"
  end
end
