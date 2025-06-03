# frozen_string_literal: true

module Ittybit
  class Tasks
    # The type of task to create.
    class TasksCreateRequestKind
      INGEST = "ingest"
      WORKFLOW = "workflow"
      SPEECH = "speech"
      VIDEO = "video"
      IMAGE = "image"
      AUDIO = "audio"
      SUMMARY = "summary"
      DESCRIBE = "describe"
      CHAPTERS = "chapters"
      OUTLINE = "outline"
      SUBTITLES = "subtitles"
      NSFW = "nsfw"
      THUMBNAILS = "thumbnails"
    end
  end
end
