# frozen_string_literal: true

module Recipepuppy
  class ResultsAggregator
    attr_accessor :page, :results

    def initialize
      @results = []
      @success = false
      @page = 0
    end

    def entries
      @entries ||= results.flat_map(&:entries)
    end

    def success?
      @success ||= results.all?(&:success)
    end

    def as_json(options = {})
      {
        entries: entries,
        success: success?,
        page: page,
        total_results: entries.size
      }
    end
  end
end
