# frozen_string_literal: true

module Recipepuppy
  class Interface
    PER_PAGE = 20
    MAX_PER_PAGE = 10.0

    def self.search(params)
      new(params.symbolize_keys).execute_calls
    end

    def initialize(params)
      @search = params[:search]
      @page = (params[:page] || 1).to_i
      @per_page = (params[:per_page] || PER_PAGE).to_i
      @required_number_of_calls = (@per_page / MAX_PER_PAGE).ceil
      @aggregator = Recipepuppy::ResultsAggregator.new
    end

    def execute_calls(*args)
      @required_number_of_calls.times.map do |i|
        @page += i
        @aggregator.results << Recipepuppy::Client.call_api(processed_params)
      end
      @aggregator.page = @page

      @aggregator
    end

    protected

    def processed_params
      {
        p: @page,
        q: @search
      }
    end
  end
end
