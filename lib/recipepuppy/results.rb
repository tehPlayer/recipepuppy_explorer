# frozen_string_literal: true

module Recipepuppy
  class Results
    attr_reader :response, :success, :url, :body, :entries
    alias success? success

    def initialize(response)
      @response = response
      @success = response.status == 200
      @url = response.env.url
      if success?
        @body = JSON.parse(response.body)
        @entries = body['results']
      else
        @body = response.body
        @entries = []
      end
    end
  end
end
