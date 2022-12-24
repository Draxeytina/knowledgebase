class TrendsController < ApplicationController
  # GET /trends or /trends.json
  def index
    @trends_array = Trend.group(:id).map { |t| t.search }

    # Sort in descending order
    @sorted_trends = @trends_array.sort_by(&:first)

    # Group and count
    @trends = (@sorted_trends.inject(Hash.new(0)) do |total, e|
                 total[e] += 1
                 total
               end).first(10)
  end
end
