class TrendsController < ApplicationController

  # GET /trends or /trends.json
  def index
    @trendsArray = Trend.group(:id).map {|t| t.search}
    
  # Sort in descending order
    @sortedTrends = @trendsArray.sort_by(&:first)

  # Group and count
    @trends = (@sortedTrends.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}).first(10)
  end
  
end
