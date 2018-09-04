# frozen_string_literal: true

module Recipepuppy
  class Client
    BASE_URL = 'http://www.recipepuppy.com/api/'

    def self.call_api(params)
      new.call_api(params)
    end

    def call_api(params = {})
      url = build_url(params)
      response = Faraday.get(url)

      Results.new(response)
    end

    protected

    def build_url(params)
      [BASE_URL, '?', params.to_query].join
    end
  end
end
