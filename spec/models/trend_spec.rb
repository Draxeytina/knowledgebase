require 'rails_helper'

RSpec.describe 'Empty trends page', type: :request do
  describe 'GET /trends' do
    before do
      get '/trends'
      @body = response.body
    end

    it 'should display the page' do
      expect(@body).to include('Most searched words')
    end

    it 'should display one of the trends save' do
      expect(@body).not_to include('Mr Emil')
    end
  end
end

RSpec.describe Trend do
  it "checks if correct data can be saved" do
    trend = Trend.new(session_id: 'sdsdsdKJnow', search: 'I enjoy this ')

    expect(trend.search).to eq('I enjoy this ')
  end
end

RSpec.describe 'Trend page with data', type: :request do
  describe 'GET /trends' do
    trend = Trend.new(session_id: 'sdsdsdKJnow', search: 'I enjoy this ')

    before do
      get '/trends'
      @body = response.body
    end

    it 'should display trends' do
      expect(@body).not_to include('I dont enjoy this')
    end

    it 'should display trends' do
      trend.save
      expect(@body).to include('I enjoy this')
    end
  end
end
