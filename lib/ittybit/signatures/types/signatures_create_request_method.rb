# frozen_string_literal: true

module Ittybit
  class Signatures
    # Optional HTTP method allowed for the signed URL. Defaults to 'get'.
    class SignaturesCreateRequestMethod
      GET = "get"
      PUT = "put"
      POST = "post"
      DELETE = "delete"
    end
  end
end
